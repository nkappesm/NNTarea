class CreateRounds < ActiveRecord::Migration
  def change
    create_table :rounds do |t|
      t.string :result

      t.timestamps null: false
    end
  end
end
