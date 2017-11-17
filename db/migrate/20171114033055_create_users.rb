class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
    	t.string :account
    	t.string :password
    	t.string :nickname
    	t.boolean :sex
    	t.date :birth
    	t.timestamps
    end
  end
end
