class CreateOnlineAccounts < ActiveRecord::Migration[5.1]
  def change
    create_table :online_accounts do |t|
    	t.integer :user_id
      t.timestamps
    end
  end
end
