class RemoveColumnFromImages < ActiveRecord::Migration[6.0]
  def change
    remove_column :images, :team, :string
  end
end
