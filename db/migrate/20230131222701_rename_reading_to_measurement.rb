# frozen_string_literal: true

class RenameReadingToMeasurement < ActiveRecord::Migration[7.0]
  def change
    rename_table :readings, :measurements
  end
end
