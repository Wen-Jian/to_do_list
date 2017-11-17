class AddOnlineStatusToUsers < ActiveRecord::Migration[5.1]
  def change
  	add_column(:users, :login_status, :boolean)
  	add_column(:lists, :user_id, :integer)
  	add_index :lists, :user_id
  end
end
