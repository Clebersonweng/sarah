class Variety < ApplicationRecord
    before_destroy :check_relation
    before_create :add_zeros_to_code
    
    has_many :type_of_crops, dependent: :destroy
    
    validates :descr, length: { minimum: 3, maximum: 50}, format: { with: /\A[a-zA-Z0-9 ]+\z/}
  	validates :code, uniqueness: true, length: { maximum: 4 } 
  
    





  private
  	def add_zeros_to_code 
      codigo = Variety.maximum(:code) #5
      nuevoCodigo = codigo.to_i + 1 
      nuevoCodigo = nuevoCodigo.to_s.rjust(4, '0')  # => '0005'
      self.code = nuevoCodigo   
    end

    def check_relation
      exist_relation = TypeOfCrop.where(:variety_id => self.id)
      return true if exist_relation.count == 0
      errors[:base] << "No se puede eliminar variedades tiene relaciones con tipo de cultivo!"
      # or errors.add_to_base in Rails 2
      false
      # Rails 5
      throw(:abort)
    end

end
