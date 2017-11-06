class UpdateToStatusAndNotes < ActiveRecord::Migration[5.1]
  def change
  	remove_column(:lists, :status)
  	remove_column(:lists, :notes)
  	add_column(:lists, :status, :string)
  	add_column(:lists, :notes, :text)
  end
end
