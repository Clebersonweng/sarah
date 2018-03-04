class Person < ApplicationRecord
  belongs_to :user
  has_many :farming_plots
  #has_many :man_powers
  has_many :man_power_details

end
