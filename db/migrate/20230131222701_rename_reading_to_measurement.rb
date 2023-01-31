class RenameReadingToMeasurement < ActiveRecord::Migration[7.0]
  def change
    rename_table :reading, :measurement
  end
end
