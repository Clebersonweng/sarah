class Implement < ApplicationRecord
  belongs_to :machine
  validates_presence_of :name, :model, :oper_time, :machine, :coef_cccr
end
