class CreateGames < ActiveRecord::Migration[5.1]
  def change
    create_table :games do |t|
      t.integer :player_id
      t.integer :at_bat
      t.integer :run
      t.integer :hit
      t.integer :walk
      t.integer :run_batted_in
      t.integer :home_run
      t.integer :stolen_base
      t.integer :strike_out

      t.timestamps
    end
  end
end
