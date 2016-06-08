class ResultsSetup < ActiveRecord::Migration
  def change
  	add_column :results, :player_id, :integer
  	add_column :results, :round_id, :integer
  	add_column :results, :bet_amount, :integer
  	add_column :results, :bet_value, :string
  end
end
