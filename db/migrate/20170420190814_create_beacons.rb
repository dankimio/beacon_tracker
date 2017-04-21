class CreateBeacons < ActiveRecord::Migration[5.0]
  def change
    create_table :beacons do |t|
      t.integer :major, null: false
      t.integer :minor, null: false
      t.string :code, null: false
      t.integer :status, default: 0
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
    add_index :beacons, [:major, :minor], unique: true
  end
end
