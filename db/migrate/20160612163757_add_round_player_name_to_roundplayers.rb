class AddRoundPlayerNameToRoundplayers < ActiveRecord::Migration
  def change
  	add_column :round_players, :bet_name, :string
  end
end
