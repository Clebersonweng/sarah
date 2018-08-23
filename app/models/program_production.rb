class ProgramProduction < ApplicationRecord
	has_one :man_power
	has_one :cost_oper_machine_cont
	has_one :cost_oper_machine
	has_one :manu_indi_expense
	belongs_to :estimate_sale

  
  
  
	validates :stock_end, presence: true, length: { minimum: 3 }
	# validates :stock_initial, presence: true,numericality: true, length: { minimum: 3 }
	validates :variation_stock, presence: true,numericality: true
	validates :program_production, presence: true ,length: { minimum: 3 }
	#validates :stock_end,numericality: true, :format => { :with => /\A\d+(?:\.\d{0,2})?\z/ }, :numericality => {:greater_than => 0}
	#validates :stock_initial, :format => { :with => /\A\d+(?:\.\d{0,2})?\z/ }, :numericality => {:greater_than_or_equal_to => 0}
	# validates :variation_stock, numericality: true

	def self.result_income_statements(program_production_id)
		ProgramProduction.find_by_sql( 
            " 
        SELECT 
                    ingresos.parcela
                    ,tipo_de_cultivo
                    ,area
                    ,ingresos.price as precio
                    ,rendimiento_esperado
                    ,max(round((venta_bruta::numeric), 0))::integer as venta_bruta
                    ,max(devoluciones) AS devoluciones
                    ,max(descuentos) AS descuentos
                    ,max(ventas_netas::integer) as ventas_netas
                    ,max(total_g_maquina_propia::integer) as total_g_maquina_propia
                    ,max(total_g_maquina_terceros::integer) as total_g_maquina_terceros
                    ,max(total_g_insumos::integer) as total_g_insumos
                    ,max(total_g_mano_obra::integer) as total_g_mano_obra
                    ,max(total_g_comercializacion::integer) as total_g_comercializacion
                    ,max(total_g_estructura::integer) as total_g_estructura
                    ,max(dotacion_amortizaciones) as dotacion_amortizaciones
                    ,max(total_g_indirectos_produccion::integer) as total_g_indirectos_produccion
                    ,max(total_g_comercializacion::integer) as total_g_comercializacion
                    ,max((total_g_maquina_propia+total_g_maquina_terceros+total_g_insumos+total_g_mano_obra)/area)::integer AS costo_x_ha
                    ,max(total_g_maquina_propia+total_g_maquina_terceros+total_g_insumos+total_g_mano_obra)::integer AS total_costo_prod_unid_vend_parcela
                    ,sum(total_g_maquina_propia+total_g_maquina_terceros+total_g_insumos+total_g_mano_obra+total_g_comercializacion+total_g_estructura+dotacion_amortizaciones+total_g_indirectos_produccion) as costo_total
                    ,max(ventas_netas - (total_g_maquina_propia+total_g_maquina_terceros+total_g_insumos+total_g_mano_obra+total_g_comercializacion))::integer AS margen_producto
                    ,((max(ventas_netas) - max(total_g_maquina_propia+total_g_maquina_terceros+total_g_insumos+total_g_mano_obra ) ) - max(total_g_indirectos_produccion + total_g_estructura ))::integer AS resultado_explotacion
                    --,((max(ventas_netas) - max(total_g_maquina_propia+total_g_maquina_terceros+total_g_insumos+total_g_mano_obra ) ) - max(total_g_indirectos_produccion + total_g_estructura ))::integer AS resultado_ante_impuestos
                   -- ,max(COALESCE(0,0)) AS resultado_sociedades
                   -- ,((max(ventas_netas) - max(total_g_maquina_propia+total_g_maquina_terceros+total_g_insumos+total_g_mano_obra ) ) - max(total_g_indirectos_produccion + total_g_estructura ))::integer AS resultado_despues_impuestos
                    ,max((ventas_netas - (total_g_maquina_propia+total_g_maquina_terceros+total_g_insumos+total_g_mano_obra+total_g_comercializacion)) - (total_g_indirectos_produccion+total_g_estructura+dotacion_amortizaciones))::integer AS utilidad
                                 FROM
                    (
                        SELECT 
                             program_productions.id as programa_id 
                            ,farming_plots.name As parcela
                            ,farming_plots.area::numeric AS area
                            ,type_of_crops.name AS tipo_de_cultivo
                            ,price
                            ,estimate_production as rendimiento_esperado
                            ,max(coalesce(gross_sale,0)) AS venta_bruta 
                            , max(devoluciones) AS devoluciones
                            , max(descuentos) AS descuentos
                            ,max(ROUND(gross_sale::numeric-(sss.devoluciones-dds.descuentos),0) ) as ventas_netas
                        FROM 
                            program_productions
                            ,estimate_sales
                            ,farming_plots
                            ,type_of_crops
                            , (select 0  as devoluciones) as sss
                            , (select 0 as descuentos) as dds
                        WHERE  
                            program_productions.id = #{program_production_id}
                        AND program_productions.estimate_sale_id = estimate_sales.id
                        AND estimate_sales.farming_plot_id = farming_plots.id
                        AND type_of_crops.id = estimate_sales.type_of_crop_id
                        GROUP BY
                            programa_id
                            ,parcela
                            ,area
                            ,tipo_de_cultivo
                            ,price
                            ,rendimiento_esperado
                  ) as ingresos
                    --gastos a restar de la cuenta
                 ,(
                            SELECT 
                                coalesce(sum(subtotal),0) AS total_g_maquina_propia 
                            FROM  
                                cost_oper_machines com 
                                ,cost_oper_machine_details comd 
                                ,program_productions
                            WHERE  
                                com.id  = comd.cost_oper_machine_id 
                            AND program_productions.id = com.program_production_id
                            AND program_productions.id = #{program_production_id}
                    ) as maquina_propia 
                    ,(
                        SELECT 
                            coalesce(sum(subtotal),0) AS total_g_maquina_terceros 
                        FROM
                            cost_oper_machine_conts cmc,cost_oper_machine_cont_details cmcd
                            ,program_productions
                        WHERE 
                              cmc.id = cmcd.cost_oper_machine_cont_id  
                        AND program_productions.id = cmc.program_production_id
                         AND program_productions.id = #{program_production_id}
                    ) as maquina_terceros
                    ,(
                        SELECT 
                            coalesce(sum(subtotal),0) as total_g_insumos 
                        FROM 
                           supplies s, supply_details sd
                           ,program_productions
                        WHERE 
                           s.id = sd.supply_id
                        AND program_productions.id = s.program_production_id
                        AND program_productions.id = #{program_production_id}
                    ) as insumos
                    ,(
                        SELECT 
                            coalesce(sum(subtotal),0) AS total_g_comercializacion
                        FROM 
                          mark_spendings ms
                          ,mark_spending_dets msd 
                          ,program_productions--,estimate_sales,farming_plots,type_of_crops
                            WHERE 
                                ms.id = msd.mark_spending_id
                            AND program_productions.id = ms.program_production_id
                            AND program_productions.id = #{program_production_id}
                    ) as comercializacion
                  ,(
                        SELECT 
                            coalesce(sum(subtotal),0) AS total_g_estructura
                        FROM 
                            structure_expenses se
                            ,stru_expense_dets sed 
                            ,program_productions
                        WHERE 
                            se.id = sed.structure_expense_id
                        AND program_productions.id = se.program_production_id
                        AND program_productions.id = #{program_production_id}
                     ) AS estructura
                ,(
                        SELECT 
                           coalesce(sum(subtotal),0) AS total_g_indirectos_produccion 
                      FROM 
                            manu_indi_expenses mi
                            ,manu_indi_expense_dets mid
                            ,program_productions
                        WHERE 
                            mi.id = mid.manu_indi_expense_id
                        AND program_productions.id = mi.program_production_id
                        AND program_productions.id = #{program_production_id}
                  ) as indirectos
                ,(
                        SELECT
                            coalesce(sum(subtotal),0) AS total_g_mano_obra 
                        FROM 
                           man_powers mp
                           ,man_power_details mpd
                           ,program_productions
                        WHERE 
                                mp.id = mpd.man_power_id
                            AND program_productions.id = mp.program_production_id
                            AND program_productions.id = #{program_production_id}
                   ) as mano_de_obra
                   ,(select 
                        0 
                     as dotacion_amortizaciones) as dotacion_amortizaciones
                   
                GROUP BY 
                    ingresos.parcela
                    ,ingresos.area
                    ,ingresos.tipo_de_cultivo
                    ,ingresos.price
                    ,ingresos.rendimiento_esperado
		")
	end

end
