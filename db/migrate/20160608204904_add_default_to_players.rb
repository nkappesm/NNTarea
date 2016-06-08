class AddDefaultToPlayers < ActiveRecord::Migration
  def change
  	change_column_default(:players, :money, 10000) 
  end
end
