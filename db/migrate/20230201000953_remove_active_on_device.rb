class RemoveActiveOnDevice < ActiveRecord::Migration[7.0]
  def change
    remove_column :devices, :active
  end
end
