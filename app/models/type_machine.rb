class TypeMachine < ApplicationRecord
	has_many :machines
	before_create :add_zeros_to_code
	validates_presence_of :description
	






	private
	  def add_zeros_to_code 
	    codigo = TypeMachine.maximum(:code) #5
	    nuevoCodigo = codigo.to_i + 1 
	    nuevoCodigo = nuevoCodigo.to_s.rjust(3, '0')  # => '005'
	    self.code = nuevoCodigo   
	  end
end
