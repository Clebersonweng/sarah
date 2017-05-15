class Product < ApplicationRecord
  belongs_to :unit_of_measurement
  has_many :supplies
  #scope :ultimos, =>{order["CREATE_AT DESC"].limit(2)}
  validates :price, presence: true,
            numericality: true,
            format: { :with => /\A\d{1,4}(\.\d{0,2})?\z/ }
end
