class AddColorToImage < ActiveRecord::Migration[6.0]
  def change
    add_column :images, :color, :string
  end
end
