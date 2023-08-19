class CreateActuators < ActiveRecord::Migration[7.0]
  def change
    create_table :actuators do |t|
      t.string :name
      t.boolean :state
      t.integer :consumption

      t.timestamps
    end
  end
end
