class StatisticsController < ApplicationController
  def index
      @statistics_data = PatientDetail.select(
        :PatientId, :SchoolName, :Date, :Age, :Grade, :PID
        # :Gender, :Race, :Ethnicity,
        # :DateOfSealantReceived, :SealnatsNeeded, :SealantsRecd, :SealantsReplaced,
        # :Sealants, :Experienced, :UntreatedDecayScreen, :ReferredDT, :ReferredUDT, :Services
      )

      # You can add more complex logic to calculate statistics here.

      # For example, you can calculate the number of patients with sealants.
      # @patients_with_sealants = @statistics_data.select { |data| data.Sealants == 'yes' }

      # You can add more statistics calculations as needed.

      # Render the view.
  end
end
