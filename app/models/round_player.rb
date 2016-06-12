class RoundPlayer < ActiveRecord::Base
	belongs_to :player
	belongs_to :round

	def self.obtain_bets(player)
		if player.money <= 1000 && player.money > 0
			ba = player.money			
		else
			buff = rand(2)
			if buff == 0
				ba = (player.money*8)/100
			else
				ba = (player.money*15)/100
			end
		end
	    buff = rand(101)
	    if buff <= 2
	      bv = "green"
	    elsif buff <= 51
	      bv = "red"
	    else
	      bv = "black"
	    end
	    return [ba, bv]
	end

	def self.obtain_results(plv, res_color)
		if res_color == "green"
			if res_color == plv
				return 15
			end
		elsif res_color == plv
			return 2
		else
			return 0
		end
	end
end
