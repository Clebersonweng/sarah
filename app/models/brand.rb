class Brand < ApplicationRecord
	before_destroy :check_relation
	has_many :models, :dependent => :destroy
	has_many :machines, :dependent => :destroy

	validates :name, presence: true,length: { minimum: 3 }, uniqueness: {message: "Este dato ya existe"}


  private

   def check_relation
	  	exist_relation = Model.where(:brand_id => self.id)
	  	return true if exist_relation.count == 0
	  	errors[:base] << "No se puede eliminar marca tiene relaciones con modelo y máquinas!"
			# or errors.add_to_base in Rails 2
			false
			# Rails 5
			throw(:abort)
	end


end
