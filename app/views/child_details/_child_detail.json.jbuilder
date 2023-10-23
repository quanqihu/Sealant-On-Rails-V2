# frozen_string_literal: true

json.extract! child_detail, :id, :PrescriberName, :ScreenDate, :ScreenComment, :Sealants, :UntreatedDecay,
              :TreatedDecay, :Referral, :DecayedNum, :ProviderName, :ProviderDate, :FirstSealedNum, :SecondSealedNum, :OtherPermNum, :PrimarySealed, :FluorideVarnish, :Prophylaxes, :PreventativeComment, :EvaluatorsName, :EvaluatorDate, :EvaluatorComment, :RetainedSealant, :ReferredDT, :ReferredUDT, :SealantsRecd, :SealnatsNeeded, :Experienced, :UntreatedDecay, :Services, :ORHealthStatus, :created_at, :updated_at
json.url child_detail_url(child_detail, format: :json)
