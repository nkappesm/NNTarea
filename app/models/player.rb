class Player < ActiveRecord::Base
	has_many :result
	has_many :round, through: :results
	
	validates :name, presence: true, length: { maximum: 16 }
	validates :money, presence: true
end
