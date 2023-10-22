# frozen_string_literal: true

class CreateTooths < ActiveRecord::Migration[7.1]
  def change
    create_table :tooths do |t|
      t.integer :number
      t.integer :screening
      t.integer :preventive
      t.integer :follow

      t.timestamps
    end
  end
end
