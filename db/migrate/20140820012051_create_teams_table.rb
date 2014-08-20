class CreateTeamsTable < ActiveRecord::Migration
  def change
    create_table :teams_tables do |t|
      t.column :name, :string

      t.timestamps
    end
  end
end
