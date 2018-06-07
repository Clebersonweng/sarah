class HistorySale < ApplicationRecord
	validates_presence_of :period
	validates_presence_of :date
	validates_presence_of :quantity,length: { minimum: 7, maximum: 50}
end
