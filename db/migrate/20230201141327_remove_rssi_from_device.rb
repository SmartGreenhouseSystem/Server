# frozen_string_literal: true

class RemoveRssiFromDevice < ActiveRecord::Migration[7.0]
  def change
    remove_column :devices, :rssi
  end
end
