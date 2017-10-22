class ListUpdate < ActiveRecord::Migration[5.1]
  def change
  	remove_column(:lists, :notes)
  	add_column(:lists, :notes, :serialize)
  end
end
