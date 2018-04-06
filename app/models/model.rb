class Model < ApplicationRecord
   belongs_to :brand
   has_many :machines, :dependent => :destroy
   validates_presence_of :brand
   validates :name, presence: true,length: { minimum: 3 }, uniqueness: {message: "Este dato ya existe"}
  
end
