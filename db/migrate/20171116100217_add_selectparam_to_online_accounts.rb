class AddSelectparamToOnlineAccounts < ActiveRecord::Migration[5.1]
  def change

  	add_column(:online_accounts, :selectparam, :integer)

  end
end
