class ChangeDefaultPlayers < ActiveRecord::Migration
  def change
  	change_column_default(:players, :active, true) 
  end
end
