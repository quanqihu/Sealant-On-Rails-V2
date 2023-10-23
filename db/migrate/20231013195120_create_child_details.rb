# frozen_string_literal: true

class CreateChildDetails < ActiveRecord::Migration[7.1]
  def change
    create_table :child_details do |t|
      t.string :PrescriberName
      t.date :ScreenDate
      t.string :ScreenComment
      t.boolean :Sealants
      t.boolean :UntreatedDecayScreen
      t.boolean :TreatedDecay
      t.string :Referral
      t.integer :DecayedNum
      t.string :ProviderName
      t.date :ProviderDate
      t.integer :FirstSealedNum
      t.integer :SecondSealedNum
      t.integer :OtherPermNum
      t.integer :PrimarySealed
      t.boolean :FluorideVarnish
      t.boolean :Prophylaxes
      t.string :PreventativeComment
      t.string :EvaluatorsName
      t.date :EvaluatorDate
      t.string :EvaluatorComment
      t.integer :RetainedSealant
      t.boolean :ReferredDT
      t.boolean :ReferredUDT
      t.integer :SealantsRecd
      t.integer :SealnatsNeeded
      t.boolean :Experienced
      t.boolean :UntreatedDecayFollow
      t.string :Services
      t.string :ORHealthStatus

      t.timestamps
    end
  end
end
