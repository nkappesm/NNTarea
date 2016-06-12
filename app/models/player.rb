class Player < ActiveRecord::Base
	has_many :round_players
	has_many :rounds, through: :round_players
	
	validates :name, presence: true, length: { maximum: 12 }
	validates :money, presence: true

	before_update :player_state

	def self.end_of_day
		players = Player.all
		players.each do |pl|
			pl.money += 10000
			pl.active = true
			pl.save
		end
	end

	def player_state
		if self.money <= 0
			self.active = false
		elsif self.money > 0
			self.active = true
		end
		true
	end
end