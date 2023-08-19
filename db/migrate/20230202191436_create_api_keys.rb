# frozen_string_literal: true

class CreateApiKeys < ActiveRecord::Migration[7.0]
  def change
    create_table :api_keys do |t|
      t.string :value, limit: 50, null: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
    add_index :api_keys, :value, unique: true
  end
end
