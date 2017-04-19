class ManPowerDetail < ApplicationRecord
  belongs_to :type_of_work, :person
  belongs_to :man_power, inverse_of: :man_power_details, :dependent => :destroy
end
