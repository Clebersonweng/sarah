class Depreciation < ApplicationRecord
   belongs_to :program_production
   belongs_to :cost_oper_machine
   has_many :depreciation_details, inverse_of: :depreciation, :dependent => :destroy
   accepts_nested_attributes_for :depreciation_details

   validates_presence_of :cost_oper_machine_id, :total

end
