class Brand < ApplicationRecord
  before_destroy :check_relation
  has_many :models, :dependent => :destroy
  has_many :machines, :dependent => :destroy
  validates_presence_of :name
  validate :does_not_have_any_invoice, on: :destroy
  #brand.errors[:base] << "No se puede eliminar marca tiene relaciones con modelo y máquinas!" 

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
