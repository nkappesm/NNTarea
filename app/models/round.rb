class Round < ActiveRecord::Base
	has_many :round_players
	has_many :players, through: :round_players

	def self.new_round
	    buff = rand(101)
	    if buff <= 2
	    	return Round.new(result: "green")
	    elsif buff <= 51
	    	return Round.new(result: "red")
	    else 
	    	return Round.new(result: "black")
	    end
	end

	def self.play
		round = Round.new_round
	    round.save
	    players = Player.all
	    players.where(active: true).each do |pl|
	      round.round_players.create(player: pl)
	    end
	    round.round_players.each do |rp|
	      if rp.player.active == true
	        rp.bet_name = rp.player.name
	        rva = RoundPlayer.obtain_bets(rp.player)
	        rp.bet_amount = rva[0]
	        wl = RoundPlayer.obtain_results(rva[1], round.result)
	        if wl == 15
	          rp.bet_result = "Big winner"
	        elsif wl == 2
	          rp.bet_result = "Winner"
	        else
	          rp.bet_result = "Looser"
	        end
	        rp.bet_value = rva[1]
	        rp.player.money = (rp.player.money + rva[0]*(wl - 1))
	        rp.round_money = rp.player.money
	        if rp.player.money <= 0
	          rp.player.active = false
	        end
	        rp.player.save
	        rp.save
	      end
	    end	
	    self.delay(:run_at => 1.minutes.from_now).play		
	end	
end