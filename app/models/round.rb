class Round < ActiveRecord::Base
	has_many :round_players
	has_many :players, through: :round_players

	def self.play_round
	    buff = rand(0..100)
	    puts "yay"
	    if buff <= 2
	    	return Round.new(result: "verde")
	    elsif buff <= 51
	    	return Round.new(result: "rojo")
	    else 
	    	return Round.new(result: "negro")
	    end
	end
end