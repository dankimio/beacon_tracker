class CreateLocations < ActiveRecord::Migration[5.0]
  def change
    create_table :locations do |t|
      t.belongs_to :beacon, foreign_key: true
      t.belongs_to :user, foreign_key: true
      t.float :latitude, null: false
      t.float :longitude, null: false
      t.string :address
      t.string :city
      t.string :country
      t.string :country_code

      t.timestamps
    end
  end
end
