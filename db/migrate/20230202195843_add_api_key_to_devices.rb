# frozen_string_literal: true

class AddApiKeyToDevices < ActiveRecord::Migration[7.0]
  def change
    add_reference :devices, :api_key, index: { unique: true }, null: false, foreign_key: true
  end
end
