class CreateUserEventships < ActiveRecord::Migration[5.1]
  def change
    create_table :user_eventships do |t|

    	t.integer :user_id
    	t.integer :event_id

      t.timestamps
    end

    add_index :user_eventships, :event_id
    add_index :user_eventships, :user_id
  end
end
