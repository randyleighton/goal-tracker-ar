class CreateGoalsTable < ActiveRecord::Migration
  def change
    create_table :goals do |t|
      t.column  :game_id,   :int
      t.column  :player_id, :int
      t.column  :assist_id, :int

      t.timestamps
    end
  end
end
