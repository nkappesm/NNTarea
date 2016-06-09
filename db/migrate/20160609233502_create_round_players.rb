class CreateRoundPlayers < ActiveRecord::Migration
  def change
    create_table :round_players do |t|
      t.integer :player_id
      t.integer :round_id
      t.string :bet_value
      t.integer :bet_amount

      t.timestamps null: false
    end
  end
end
