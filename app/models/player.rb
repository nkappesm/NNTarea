class Player < ActiveRecord::Base
	has_many :round_players
	has_many :rounds, through: :results
	
	validates :name, presence: true, length: { maximum: 16 }
	validates :money, presence: true
end
