class Employee < ApplicationRecord
  belongs_to :user
  has_many :farming_plots, :dependent => :destroy
end
