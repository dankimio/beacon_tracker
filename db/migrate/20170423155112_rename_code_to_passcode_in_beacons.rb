class RenameCodeToPasscodeInBeacons < ActiveRecord::Migration[5.0]
  def change
    rename_column :beacons, :code, :passcode
  end
end
