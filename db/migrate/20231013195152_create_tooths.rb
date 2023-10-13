class CreateTooths < ActiveRecord::Migration[7.1]
  def change
    create_table :tooths do |t|
      t.references :patient_detail, null: false, foreign_key: { to_table: :patient_details, primary_key: :PID }
      t.integer :number
      t.integer :screening
      t.integer :preventive
      t.integer :follow

      t.timestamps
    end
  end
end
