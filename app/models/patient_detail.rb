class PatientDetail < ApplicationRecord
    validates :PatientId, uniqueness: { scope: :SchoolName, message: 'Duplicate Patient details for the same SchoolName' }
end
