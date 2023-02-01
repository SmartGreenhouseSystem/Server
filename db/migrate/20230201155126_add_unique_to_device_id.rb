class AddUniqueToDeviceId < ActiveRecord::Migration[7.0]
  def change
    add_index :devices, :device_id, unique: true
  end
end
