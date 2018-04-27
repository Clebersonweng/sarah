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

	def self.result_income_statements(farming_plot_id)
		ProgramProduction.find_by_sql( 
            " 	
            SELECT 
                farming_plots.name As parcela
                ,type_of_crops.name AS tipo_de_cultivo
                ,round(CAST (venta_bruta AS numeric), 4) as venta_bruta
                ,devoluciones
                ,descuentos
                ,ventas_netas
                ,ROUND(CAST(total_g_maquina_propia AS numeric), 2) as total_g_maquina_propia
                ,ROUND(CAST(total_g_maquina_terceros AS numeric), 2) as total_g_maquina_terceros
                ,ROUND(CAST(total_g_insumos AS numeric), 2) as total_g_insumos
                ,ROUND(CAST(total_g_mano_obra AS numeric), 2) as total_g_mano_obra
                ,ROUND(CAST(total_g_comercializacion AS numeric), 2) as total_g_comercializacion
                ,ROUND(CAST(total_g_estructura AS numeric), 2) as total_g_estructura
                ,0 as dotacion_amortizaciones
                ,ROUND(CAST(total_g_indirectos_produccion AS numeric), 2) as total_g_indirectos_produccion
                ,ROUND(CAST(total_g_comercializacion AS numeric), 2) as total_g_comercializacion
                ,ROUND(CAST((total_g_maquina_propia+total_g_maquina_terceros+total_g_insumos+total_g_mano_obra)/farming_plots.area AS numeric), 2) AS costo_x_ha
                ,ROUND(CAST(total_g_maquina_propia+total_g_maquina_terceros+total_g_insumos+total_g_mano_obra AS numeric), 2) AS total_costo_prod_unid_vend_parcela
                ,ventas_netas - ROUND(CAST(total_g_maquina_propia+total_g_maquina_terceros+total_g_insumos+total_g_mano_obra AS numeric), 2) AS margen_producto
                ,((ventas_netas - (total_g_maquina_propia+total_g_maquina_terceros+total_g_insumos+total_g_mano_obra ) ) - (total_g_indirectos_produccion + total_g_estructura )) AS resultado_explotacion
               ,0 as ingresos_financieros
               ,0 as gastos_extraordinarios
                ,((ventas_netas - (total_g_maquina_propia+total_g_maquina_terceros+total_g_insumos+total_g_mano_obra ) ) - (total_g_indirectos_produccion + total_g_estructura )) as resultado_ante_impuestos
               , 0 AS resultado_sociedades
               ,((ventas_netas - (total_g_maquina_propia+total_g_maquina_terceros+total_g_insumos+total_g_mano_obra ) ) - (total_g_indirectos_produccion + total_g_estructura )) as resultado_despues_impuestos
       
            FROM
                farming_plots
                ,type_of_crops
                ,estimate_sales
                --,program_productions
                ,(SELECT 
                    coalesce(gross_sale,0) AS venta_bruta 
                    , devoluciones
                    , descuentos
                    ,ROUND(CAST(gross_sale-(devoluciones-descuentos) as numeric),2) as ventas_netas
                    from 
                     estimate_sales
                    ,farming_plots
                    , (select 0  as devoluciones) as sss
                    , (select 0 as descuentos) as dds
                    where  
                    estimate_sales.farming_plot_id = farming_plots.id
                    AND farming_plots.id = '#{farming_plot_id}'
                ) as fooo
                 --gastos a restar de la cuenta
                ,(SELECT 
                        coalesce(sum(subtotal),0) AS total_g_maquina_propia 
                    from  
                        cost_oper_machines com 
                        ,cost_oper_machine_details comd 
                        ,program_productions,estimate_sales,farming_plots
                    where  
                        com.id = comd.cost_oper_machine_id 
                    AND program_productions.id = com.program_production_id
                    AND estimate_sales.id = program_productions.estimate_sale_id
                    AND farming_plots.id = '#{farming_plot_id}'
                ) as aaa 
                ,(select 
                        coalesce(sum(subtotal),0) AS total_g_maquina_terceros 
                    from 
                        cost_oper_machine_conts cmc,cost_oper_machine_cont_details cmcd
                        ,program_productions,estimate_sales,farming_plots
                    where 
                        cmc.id = cmcd.cost_oper_machine_cont_id  
                    AND 
                        program_productions.id = cmc.program_production_id
                    AND 
                        estimate_sales.id = program_productions.estimate_sale_id
                    AND 
                        estimate_sales.farming_plot_id = farming_plots.id
                    AND 
                        farming_plots.id = '#{farming_plot_id}'
                ) as bbb
                ,(select 
                    coalesce(sum(subtotal),0) as total_g_insumos 
                from 
                    supplies s, supply_details sd
                    ,program_productions,estimate_sales,farming_plots
                where 
                    s.id = sd.supply_id
                AND 
                    program_productions.id = s.program_production_id
                AND 
                    estimate_sales.id = program_productions.estimate_sale_id
                AND 
                    estimate_sales.farming_plot_id = farming_plots.id
                AND 
                    farming_plots.id = '#{farming_plot_id}'
                ) as ccc
                ,(select 
                    coalesce(sum(subtotal),0) AS total_g_comercializacion
                from 
                    mark_spendings ms
                    ,mark_spending_dets msd 
                    ,program_productions,estimate_sales,farming_plots
                where 
                    ms.id = msd.mark_spending_id
                AND 
                    program_productions.id = ms.program_production_id
                AND 
                    estimate_sales.id = program_productions.estimate_sale_id
                AND 
                    estimate_sales.farming_plot_id = farming_plots.id
                AND 
                    farming_plots.id = '#{farming_plot_id}'
                ) as dddd
                ,(select 
                        coalesce(sum(subtotal),0) AS total_g_estructura
                    from 
                        structure_expenses se
                        ,stru_expense_dets sed 
                        ,program_productions,estimate_sales,farming_plots
                    where 
                    se.id = sed.structure_expense_id
                AND 
                    program_productions.id = se.program_production_id
                AND 
                    estimate_sales.id = program_productions.estimate_sale_id
                AND 
                    estimate_sales.farming_plot_id = farming_plots.id
                AND 
                    farming_plots.id = '#{farming_plot_id}'
                ) AS eeee
             ,(select 
                    coalesce(sum(subtotal),0) AS total_g_indirectos_produccion 
                from 
                    manu_indi_expenses mi
                    ,manu_indi_expense_dets mid
                    ,program_productions,estimate_sales,farming_plots
                where 
                    mi.id = mid.manu_indi_expense_id
                AND 
                    program_productions.id = mi.program_production_id
                AND 
                    estimate_sales.id = program_productions.estimate_sale_id
                AND 
                    estimate_sales.farming_plot_id = farming_plots.id
                AND 
                    farming_plots.id = '#{farming_plot_id}'
                ) as gggg
             ,(select 
                    coalesce(sum(subtotal),0) AS total_g_mano_obra 
                from 
                    man_powers mp
                    ,man_power_details mpd
                    ,program_productions,estimate_sales,farming_plots
                where 
                    mp.id = mpd.man_power_id
                AND 
                    program_productions.id = mp.program_production_id
                AND 
                    estimate_sales.id = program_productions.estimate_sale_id
                AND 
                    estimate_sales.farming_plot_id = farming_plots.id
                AND 
                    farming_plots.id = '#{farming_plot_id}'
                ) as jjj
             where 
                farming_plots.id = '#{farming_plot_id}'
             AND type_of_crops.id = estimate_sales.type_of_crop_id
             --  AND estimate_sales.farming_plot_id = farming_plots.id
             -- AND program_productions.id = estimate_sales.id
            group by 
            parcela
            ,tipo_de_cultivo
            ,venta_bruta
            ,devoluciones
            ,descuentos
            ,ventas_netas
            ,total_g_maquina_propia
            ,total_g_maquina_terceros
            ,total_g_insumos
            ,total_g_mano_obra
            ,total_g_comercializacion
            ,total_g_estructura
            ,total_g_indirectos_produccion
            ,costo_x_ha
            ,total_costo_prod_unid_vend_parcela
            ,margen_producto
             
		 ")
	end

end
