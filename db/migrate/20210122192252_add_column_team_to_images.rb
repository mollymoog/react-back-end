class AddColumnTeamToImages < ActiveRecord::Migration[6.0]
  def change
    add_reference :images, :team, null: false, foreign_key: true
  end
end
