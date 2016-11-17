class ManPower < ApplicationRecord
  belongs_to :program_production
  has_many :man_power_details, inverse_of: :man_power, :dependent => :destroy
  accepts_nested_attributes_for :man_power_details
  validates_presence_of :total_hours_needed, :total
end
