class CreateTeams < ActiveRecord::Migration[6.0]
  def change
    create_table :teams do |t|
      t.string :team_name
      t.string :color
      t.belongs_to :game, null: false, foreign_key: true

      t.timestamps
    end
  end
end
