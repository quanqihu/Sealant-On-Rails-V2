# frozen_string_literal: true

class EventDetail < ApplicationRecord
  validates :EventDate, presence: true
  validates :School, presence: true
  validates :ConsentFD, presence: true
  validates :DenHrs, presence: true
  validates :DenTravelHrs, presence: true
  validates :DenTravelMil, presence: true
  validates :HygHours, presence: true
  validates :HygTravelMil, presence: true
  validates :HygTravelHrs, presence: true
  validates :AssistantTravelMil, presence: true
  validates :AssistantHrs, presence: true
  validates :AssistantTravelHrs, presence: true
  validates :OtherHrs, presence: true
  validates :OtherTravelHrs, presence: true
  validates :OtherTravelMiles, presence: true
  validates :NumberOfSSPDriven, presence: true
  validates :TotalMilesDriven, presence: true
  # Not needed in event details page
  validates :ChildScreened, presence: false, allow_blank: true
  validates :ChildReceivingSealant, presence: false, allow_blank: true
  validates :NumberOfSealed, presence: false, allow_blank: true
  validates :NumberFlourideVarnish, presence: false, allow_blank: true
  validates :NumberProphy, presence: false, allow_blank: true
end
