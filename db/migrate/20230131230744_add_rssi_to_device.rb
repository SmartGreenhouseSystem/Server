# frozen_string_literal: true

class AddRssiToDevice < ActiveRecord::Migration[7.0]
  def change
    add_column :devices, :rssi, :integer
    add_column :devices, :active, :bool
  end
end
