# frozen_string_literal: true

class PatientDetail < ApplicationRecord

  self.primary_key = "PID"

  validates :PatientId, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :SchoolName, presence: true
  validates :Age, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :Date, presence: true
  validates :Insurance, presence: true
  validates :Grade, presence: true
  validates :PatientId,
            uniqueness: { scope: :SchoolName, message: 'Duplicate Patient details for the same SchoolName' }
  validates :PID, uniqueness: true
  has_many :child_level_details, foreign_key: 'PID', primary_key: 'PID'
end
