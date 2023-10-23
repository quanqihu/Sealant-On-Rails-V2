# frozen_string_literal: true

class CreateTooths < ActiveRecord::Migration[7.1]
  def change
    create_table :tooths do |t|
      t.references :patient_detail, foreign_key: true
      t.integer :tooth_number
      t.text :details

      t.timestamps

    end
  end
end
