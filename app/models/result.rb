class Result < ActiveRecord::Base
	belongs_to :player
	belongs_to :round

	def self.obtain_round_results(round, player)
		rn = Random.new
		if player.money <= 1000 && player.money > 0
			ba = player.money
		else
			buff = rn.rand(0..1)
			if buff == 0
				ba = (player.money*8)/100
			else
				ba = (player.money*15)/100
			end
		end
	    buff = rn.rand(0..100)
	    if buff <= 2
	      bv = "verde"
	    elsif buff <= 51
	      bv = "rojo"
	    else
	      bv = "negro"
	    end
	    return [ba,bv]
	end
end