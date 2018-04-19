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
		ProgramProduction.find_by_sql([ " 	

		   select 
                farming_plots.name As parcela,type_of_crops.name AS tipo_de_cultivo, ingreso_bruto,total_g_maquina_propia,total_g_maquina_terceros,total_g_insumos,total_g_comercializacion,total_g_estructura,total_g_indirectos_produccion
            from 
            	farming_plots
                ,type_of_crops
                ,estimate_sales
               ,(SELECT 
                 	gross_sale AS ingreso_bruto  
                 from 
                 estimate_sales
                ) as fooo
             --gastos a restar de la cuenta
               ,(SELECT 
                 	coalesce(sum(subtotal),0) AS total_g_maquina_propia 
                 from  
                 	cost_oper_machines com 
                    ,cost_oper_machine_details comd  
                 where  
                 	com.id = comd.cost_oper_machine_id 
                ) as aaa 
               ,(select 
                 	sum(subtotal) AS total_g_maquina_terceros 
                 from 
                 	cost_oper_machine_conts cmc,cost_oper_machine_cont_details cmcd 
                 where 
                 	cmc.id = cmcd.cost_oper_machine_cont_id 
                ) as bbb
               ,(select 
                 	sum(subtotal) as total_g_insumos 
                 from 
                 	supplies s, supply_details sd 
                 where 
                 	s.id = sd.supply_id) as ccc
               ,(select 
                    sum(subtotal) AS total_g_comercializacion
                from 
                    mark_spendings ms
                    ,mark_spending_dets msd 
                where 
                    ms.id = msd.mark_spending_id
               ) as dddd
               ,(select 
                    sum(subtotal) AS total_g_estructura
                from 
                    structure_expenses se
                    ,stru_expense_dets sed 
                where 
                    se.id = sed.structure_expense_id
                ) AS eeee
                ,(select 
                    sum(subtotal) AS total_g_indirectos_produccion 
                from 
                    manu_indi_expenses mi
                    , manu_indi_expense_dets mid
                 where 
                     mi.id = mid.manu_indi_expense_id
          		) as gggg
          where 
              farming_plots.id = '#{farming_plot_id}'
              AND type_of_crops.id = estimate_sales.type_of_crop_id
		 "])
	end

end
