class Player < ActiveRecord::Base
	has_many :round_players
	has_many :rounds, through: :round_players
	
	validates :name, presence: true, length: { maximum: 12 }
	validates :money, presence: true

	before_update :player_state

	def self.end_of_day
		t = Time.new
		buff_t = t.hour
		buff_t *= 60
		buff_t += t.min
		buff_t = (24*60) - buff_t
		players = Player.all
		players.each do |pl|
			if (t.hour == 23 && t.minute >= 59) || (t.hour == 0 && t.minute <= 1)
				pl.money += 10000
				pl.active = true
				pl.save
			end
		end
		self.delay(:run_at => buff_t.minutes.from_now).end_of_day
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