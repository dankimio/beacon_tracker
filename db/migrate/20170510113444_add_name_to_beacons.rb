class AddNameToBeacons < ActiveRecord::Migration[5.0]
  def change
    add_column :beacons, :name, :string
  end
end
