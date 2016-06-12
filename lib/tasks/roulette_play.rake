=begin
namespace :roulette do 
	desc "Controls the roulette plays and updates"
	task :round_play => :environment do
		Round.start_roulette
	end
	task :day_update => :environment do
		Player.end_of_day
	end
end
=end