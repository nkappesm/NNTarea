class Player < ActiveRecord::Base
	validates :name, presence: true, length: { maximum: 16 }
	validates :money, presence: true
end
