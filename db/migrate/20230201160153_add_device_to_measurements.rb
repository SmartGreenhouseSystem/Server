# frozen_string_literal: true

class AddDeviceToMeasurements < ActiveRecord::Migration[7.0]
  def change
    add_reference :measurements, :device, null: false, foreign_key: true
  end
end
