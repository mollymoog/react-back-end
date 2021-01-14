class DropWordsTable < ActiveRecord::Migration[6.0]
  def change
    drop_table :words
  end
end
