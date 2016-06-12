class AddRoundPlayerMoneyToRoundPlayer < ActiveRecord::Migration
  def change
  	add_column :round_players, :round_money, :integer
  end
end
