class Round < ActiveRecord::Base
	has_many :result
	has_many :player, through: :results

	def self.play_round
	    rn = Random.new
	    buff = rn.rand(0..100)
	    if buff <= 2
	    	return Round.new(result: "verde")
	    elsif buff <= 51
	    	return Round.new(result: "rojo")
	    else 
	    	return Round.new(result: "negro")
	    end
	end
end
