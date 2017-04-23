class AddMajorMinorToBeacons < ActiveRecord::Migration[5.0]
  def change
    add_column :beacons, :major_minor, :string, null: false
    add_index :beacons, :major_minor, unique: true
  end
end
