class AddNotNullFieldsToDevice < ActiveRecord::Migration[7.0]
  def change
      change_column_null :devices, :device_id, false
      change_column_null :devices, :name, false
  end
end
