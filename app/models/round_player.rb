class RoundPlayer < ActiveRecord::Base
	belongs_to :player
	belongs_to :round

	def self.obtain_round_results(player)
		if player.money <= 1000 && player.money > 0
			ba = player.money			
		else
			buff = rand(0..1)
			if buff == 0
				ba = (player.money*8)/100
			else
				ba = (player.money*15)/100
			end
		end


	    buff = rand(0..100)
	    if buff <= 2
	      bv = "verde"
	    elsif buff <= 51
	      bv = "rojo"
	    else
	      bv = "negro"
	    end
	    return [ba, bv]
	end
end
