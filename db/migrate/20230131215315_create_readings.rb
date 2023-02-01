# frozen_string_literal: true

class CreateReadings < ActiveRecord::Migration[7.0]
  def change
    create_table :readings do |t|
      t.string :name
      t.float :value
      t.datetime :recorded_at

      t.timestamps
    end
  end
end
