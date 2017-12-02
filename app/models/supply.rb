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

end
