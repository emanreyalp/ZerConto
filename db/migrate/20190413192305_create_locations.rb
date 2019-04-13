class CreateLocations < ActiveRecord::Migration[5.2]
  def change
    create_table :locations do |t|
      t.string :address
      t.string :city
      t.string :zip_code
      t.references :country, foreign_key: true

      t.timestamps
    end
  end
end
