class CreateTooths < ActiveRecord::Migration[7.1]
  def change
    create_table :tooths do |t|
      t.references :patient, null: false, foreign_key: true
      t.integer :number
      t.integer :screening
      t.integer :preventive
      t.integer :follow

      t.timestamps
    end
  end
end
