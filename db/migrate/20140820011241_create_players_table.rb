class CreatePlayersTable < ActiveRecord::Migration
  def change
    create_table :players_tables do |t|
      t.column  :name,    :string
      t.column  :number,  :int
      t.column  :team_id, :int

      t.timestamps
    end
  end
end
