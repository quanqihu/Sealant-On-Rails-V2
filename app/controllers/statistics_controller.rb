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

  def school
    @school_data = PatientDetail.select(
      :SchoolName,
      :Date,
      'COUNT(DISTINCT patient_details.PatientId) AS children_screened',
      'SUM(child_level_details.FirstSealedNum) AS FirstSealed',
      'COUNT(DISTINCT CASE WHEN COALESCE(child_level_details.FirstSealedNum, 0) > 0 OR COALESCE(child_level_details.SecondSealedNum, 0) > 0 OR COALESCE(child_level_details.OtherPermNum, 0) > 0 OR COALESCE(child_level_details.PrimarySealed, 0) > 0 THEN patient_details.PatientId ELSE NULL END) AS children_rec_sealants',
      'SUM(COALESCE(child_level_details.FirstSealedNum, 0) + COALESCE(child_level_details.SecondSealedNum, 0) + COALESCE(child_level_details.OtherPermNum, 0) + COALESCE(child_level_details.PrimarySealed, 0)) AS teeth_sealed',
      'SUM(CASE WHEN child_level_details.FluorideVarnish = true THEN 1 ELSE 0 END) AS children_with_fluoride'
    )
    .joins(:child_level_details)
    .group(:SchoolName, :Date)
  end
end
