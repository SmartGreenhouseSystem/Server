class ChangeTypeToMeasurementType < ActiveRecord::Migration[7.0]
  def change
    rename_column :readings, :type, :measurement_type
  end
end
