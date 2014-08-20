class CreateGamesTable < ActiveRecord::Migration
  def change
    create_table :games_tables do |t|
      t.column :game_date,  :datetime
      t.column :home_id,    :int
      t.column :visitor_id, :int

      t.timestamps
    end
  end
end
