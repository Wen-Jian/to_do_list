class UpdateColumn < ActiveRecord::Migration[5.1]
  def change
  	remove_column(:lists, :status)
  	add_column(:lists, :status, :serialize)
  end
end
