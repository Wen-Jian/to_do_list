class AddColumnToList < ActiveRecord::Migration[5.1]
  def change
  	add_column(:lists, :status, :boolean)
  end
end
