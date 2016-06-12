namespace :roulette do 
	desc "Controls the roulette plays and updates"
	task :flow_start => :environment do
		Round.play
	end
	task :end_update_start => :environment do
		Player.end_of_day
	end		
end