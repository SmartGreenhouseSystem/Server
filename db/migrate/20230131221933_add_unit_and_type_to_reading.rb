# frozen_string_literal: true

class AddUnitAndTypeToReading < ActiveRecord::Migration[7.0]
  def change
    add_column :readings, :unit, :string
    add_column :readings, :type, :string
  end
end
