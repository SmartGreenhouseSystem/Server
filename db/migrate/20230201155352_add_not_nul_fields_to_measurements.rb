# frozen_string_literal: true

class AddNotNulFieldsToMeasurements < ActiveRecord::Migration[7.0]
  def change
    change_column_null :measurements, :measurement_type, false
    change_column_null :measurements, :recorded_at, false
    change_column_null :measurements, :name, false
    change_column_null :measurements, :unit, false
    change_column_null :measurements, :value, false
  end
end
