class Tooth < ApplicationRecord
  belongs_to :patient_details
  serialize :details, JSON
end
