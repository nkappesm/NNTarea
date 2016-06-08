class Result < ActiveRecord::Base
	belongs_to :players
	belongs_to :rounds
end
