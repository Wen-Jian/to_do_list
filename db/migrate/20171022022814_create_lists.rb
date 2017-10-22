class CreateLists < ActiveRecord::Migration[5.1]
  def change
    create_table :lists do |t|
    	t.string:title
    	t.date:due
    	t.text:notes

      t.timestamps
    end
  end
end
