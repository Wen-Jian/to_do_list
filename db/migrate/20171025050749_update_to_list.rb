class UpdateToList < ActiveRecord::Migration[5.1]
  def change
  	remove_column(:lists, :status)
  	add_column(:lists, :status, :boolean)
  end
end
