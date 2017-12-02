class EstimateSale < ApplicationRecord
  belongs_to :farming_plot
  belongs_to :type_of_crop
  has_one :program_production
  has_one :cost_oper_machine
  validates_presence_of :estimate_production, :price, :gross_sale, :date_init,:date_end
  before_create :add_zeros_to_code
  validates :code, uniqueness: true, length: { maximum: 7 }
  validates :estimate_production, length: { minimum: 1 },length: { maximum: 7 } 
  validates :price, :format => { :with => /\A\d+(?:\.\d{0,2})?\z/ }, :numericality => {:greater_than => 0}
  
  
  def full_periods
    #[@date_init, @date_end].reject(&:blank?).join(" ")
    "#{self.date_init}"+" | "+"#{self.date_end}"
  end
  def to_s
    full_periods
  end
  #["SELECT body FROM comments WHERE author = :user_id OR approved_by = :user_id", { :user_id => user_id }]
   def self.validate_periods(farming_plot,date_init, date_end)
      #EstimateSale.where(" date_init >= ? AND date_end <= ? AND farming_plot_id = ?",date_init, date_end,faming_plot)
      EstimateSale.find_by_sql([ " SELECT 
                                    id,name FROM type_of_crops AS crop
                                 WHERE   
                                    crop.id NOT IN 
                                    ( 
                                        SELECT 
                                        estimate_sales.type_of_crop_id 
                                        FROM 
                                        estimate_sales
                                     WHERE
                                    ((estimate_sales.date_init >=  '#{date_init}'  AND  estimate_sales.date_end <= '#{date_end}' )
                                    OR
                                    (estimate_sales.date_init BETWEEN  '#{date_init}'  AND '#{date_end}' )
                                     OR
                                    (estimate_sales.date_end BETWEEN '#{date_init}' AND '#{date_end}' ))
                                    AND estimate_sales.farming_plot_id = #{farming_plot}
                                  )
                                "])
                          
   end
  
  def self.get_crops_not_exist_es()
    EstimateSale.find_by_sql ["
                                select tc.id, tc.name 
                                from type_of_crops as tc, 
                                estimate_sales as es, 
                                farming_plots as fp 
                                where 
                                es.type_of_crop_id <> tc.id and es.farming_plot_id = fp.id 
      "]
  end
  
  private
  def add_zeros_to_code 
    codigo = EstimateSale.maximum(:code) #5
    nuevo_codigo = codigo.to_i + 1 
    nuevo_codigo = nuevo_codigo.to_s.rjust(7, '0')  # => '00005'
    self.code = nuevo_codigo   
  end
end

#SELECT type_of_crops.id,type_of_crops.name FROM type_of_crops WHERE NOT EXISTS (	SELECT estimate_sales.type_of_crop_id	FROM estimate_sales	WHERE estimate_sales.type_of_crop_id = type_of_crops.id AND estimate_sales.farming_plot_id='2'AND estimate_sales.date_init >= '2017-07-01' AND estimate_sales.date_end <= '2017-11-01' )





