class CostOperMachineCont < ApplicationRecord 
	
	belongs_to :program_production

	has_many :cost_oper_machine_cont_details, inverse_of: :cost_oper_machine_cont, :dependent => :destroy
	accepts_nested_attributes_for :cost_oper_machine_cont_details
	validates_presence_of :program_production_id, :total
  
	

	 def self.get_list_cost_outsourced()
		
		CostOperMachineCont.find_by_sql "   
														SELECT * FROM 
														(
															SELECT
																cost_oper_machine_conts.id AS machine_cont_id
																,RIGHT(CONCAT('000',cost_oper_machine_conts.id::text),3)  AS code
																,farming_plots.name AS farm_plots
																,program_production 
																,unit_of_measurements.name AS um
																,type_of_services.name AS type_service
																,cost_oper_machine_conts.total
															FROM 
																cost_oper_machine_conts
																,cost_oper_machine_cont_details
																,farming_plots
																,program_productions AS prog_prodt
																,estimate_sales
																,unit_of_measurements
																,type_of_services
															WHERE 
																cost_oper_machine_cont_details.type_of_service_id = type_of_services.id
															AND 
																estimate_sales.farming_plot_id = farming_plots.id
															AND 
																prog_prodt.estimate_sale_id =  estimate_sales.id
															AND 
																type_of_services.unit_of_measurement_id = unit_of_measurements.id
														) AS algo                     
										"
										
	 end
	 def self.get_farming_plot()
		
			CostOperMachineCont.find_by_sql
								"
									SELECT * FROM 
									(
										SELECT
											farming_plots.name AS parcela
											 ,program_production
										FROM 
											farming_plots
											 ,program_productions
											 ,estimate_sales
										WHERE 
											 estimate_sales.farming_plot_id = farming_plots.id
														AND program_productions.estimate_sale_id =  estimate_sales.id
													GROUP BY 
														farming_plots.name
														 ,program_production
											  ) AS consulta
								"
								
	 end
end
