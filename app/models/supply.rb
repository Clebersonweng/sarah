class Supply < ApplicationRecord
   belongs_to :program_production
   belongs_to :chart_of_account, optional: true
   has_many :supply_details, inverse_of: :supply
   accepts_nested_attributes_for :supply_details

   validates_presence_of :total, :program_production
  
  def self.subtotal()
  	return price * quantity_need
  
  end

  def self.quantity_need()
  	return self.area * self.dosage
  end

  def self.total_need_supply(supply)
  	SupplyDetail.select("SUM(quantity_need)").where("supply_id=?",supply)
  end

  def self.calculate_subtotal(product_id)
	Supply.find_by_sql([
								"
									select 
										farm_plots.area AS  area
										,to_char (products.price::float, 'FM999999990.00')  AS price_product
                                        ,products.tradename AS product_descr
									    ,to_char (products.dosage::float, 'FM999999990.00') AS dosage
									    ,to_char(products.dosage * area::float, 'FM999999990.00' ) AS quantity_needed
									    ,to_char( (products.dosage * area) * (products.price)::float, 'FM999999990.00' )AS subtotal
									from 
									    products
									    ,farming_plots as farm_plots
									    ,program_productions
									    ,estimate_sales
									where 
									    program_productions.estimate_sale_id = estimate_sales.id
									    AND estimate_sales.farming_plot_id = farm_plots.id
									    AND products.id = #{product_id}
									group by 
										area
                                        ,product_descr
										,price_product
										,products.price
										,dosage
										,quantity_needed
								"
							])
  end
  
  def self.list_supply_and_detail()
	Supply.find_by_sql (["			select 
										    supplies.id
										    ,prog_prod.program_production as total_production 
										    ,products.tradename
										    ,supplies.total 
										    ,sum(supply_details.quantity_needed) as total_needed
										    ,supply_needed_all_total.supply_needed_total
										    
										from 
										    supplies
										    ,supply_details
										    ,program_productions as prog_prod
										    ,products
										    ,(SELECT 
										             supply_id
										            ,SUM(quantity_needed)  as supply_needed_total 
										      	FROM 
										          supply_details
										          ,supplies 
										        where 
										      		supplies.id = supply_details.supply_id  
										      GROUP BY 
										          supply_id
										          ,total 
										     ) as supply_needed_all_total
										where 
											supplies.id = supply_details.supply_id
										and	supplies.program_production_id = prog_prod.id
										and supply_details.product_id = products.id
										and supplies.id = supply_needed_all_total.supply_id
										group by 
										    supplies.id,
										    supply_details.id,
										    prog_prod.id,
										    products.id,
											supply_needed_all_total.supply_needed_total
									"]
						)
    end

	def self.view_farming_plot_area

			Supply.find_by_sql ([   "	select  
											farm_plots.name AS farm_name
											,farm_plots.area AS  farm_area
	                                        ,program_productions.program_production AS prog_total_production
										from 
										    products
										    ,farming_plots as farm_plots
										    ,program_productions
										    ,estimate_sales
										where 
										    program_productions.estimate_sale_id = estimate_sales.id
										    AND estimate_sales.farming_plot_id = farm_plots.id
										    
										group by 
											farm_name
	                                        ,farm_area
	                                        ,prog_total_production
	                                "
	                            ])
		
	end
	
end
