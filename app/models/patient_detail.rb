# frozen_string_literal: true

class PatientDetail < ApplicationRecord
  validates :PatientId,
            uniqueness: { scope: :SchoolName, message: 'Duplicate Patient details for the same SchoolName' }
  validates :PID, uniqueness: true
end
