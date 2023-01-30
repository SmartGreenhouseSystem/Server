class CreateReadings < ActiveRecord::Migration[7.0]
  def change
    create_table :readings do |t|
      t.string :name
      t.float :value
      t.datetime :recored_at

      t.timestamps
    end
  end
end
