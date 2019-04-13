class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.integer :superior_id

      t.timestamps
    end
    add_index :users, :superior_id
  end
end
