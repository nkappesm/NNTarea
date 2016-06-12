class Round < ActiveRecord::Base
	has_many :round_players
	has_many :players, through: :round_players

	def self.play_round
	    buff = rand(101)
	    if buff <= 2
	    	return Round.new(result: "green")
	    elsif buff <= 51
	    	return Round.new(result: "red")
	    else 
	    	return Round.new(result: "black")
	    end
	end
end