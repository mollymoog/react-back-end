class AddColumnToImages < ActiveRecord::Migration[6.0]
  def change
    change_table(:images) do |t|
      t.column :team, :string
      t.belongs_to :game
    end
  end
end
