class CreateSelectparams < ActiveRecord::Migration[5.1]
  def change
    create_table :selectparams do |t|
    	t.integer:params

      t.timestamps
    end
  end
end
