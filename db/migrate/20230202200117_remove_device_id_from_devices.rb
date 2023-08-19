# frozen_string_literal: true

class RemoveDeviceIdFromDevices < ActiveRecord::Migration[7.0]
  def change
    remove_column :devices, :device_id
  end
end
