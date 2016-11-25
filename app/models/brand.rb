class Brand < ApplicationRecord
  has_many :models, :dependent => :destroy
  has_many :machines, :dependent => :destroy
  validates_presence_of :name
end
