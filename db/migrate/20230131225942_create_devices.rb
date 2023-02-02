# frozen_string_literal: true

class CreateDevices < ActiveRecord::Migration[7.0]
  def change
    create_table :devices do |t|
      t.string :device_id, unique: true
      t.string :name

      t.timestamps
    end
  end
end
