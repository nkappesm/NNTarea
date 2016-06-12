class AddResultRoundPlayer < ActiveRecord::Migration
  def change
  	add_column :round_players, :bet_result, :string
  end
end
