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
  #  @school_data = PatientDetail.includes(:child_details)
  #  .select("patient_details.SchoolName,patient_details.Date, 
  #            COUNT(*) as screened_children, 
  #            SUM(CASE WHEN child_details.Sealants = true THEN 1 ELSE 0 END) as children_with_sealants, 
  #            SUM(child_details.FirstSealedNum + child_details.SecondSealedNum + child_details.OtherPermNum + child_details.PrimarySealed) as sealed_teeth, 
  #            SUM(CASE WHEN child_details.FluorideVarnish = true THEN 1 ELSE 0 END) as children_with_fluoride")
  #  .group("patient_details.SchoolName, patient_details.Date")

  end
end
