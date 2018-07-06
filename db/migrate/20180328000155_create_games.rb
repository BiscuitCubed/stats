class CreateGames < ActiveRecord::Migration[5.1]
  def change
    create_table :games do |t|
      t.integer :player_id
      t.integer :at_bat
      t.integer :run
      t.integer :hit
      t.integer :walk
      t.integer :fielders_choice
      t.integer :reached_on_error
      t.integer :sacrifice_hit
      t.integer :sacrifice_fly
      t.integer :hit_by_pitch
      t.integer :reached_on_defensive_interference
      t.integer :reached_on_some_other_reason
      t.integer :run_batted_in
      t.integer :home_run
      t.integer :stolen_base
      t.integer :strike_out
      t.integer :put_out

      t.timestamps
    end
  end
end
