# frozen_string_literal: true

class ChildDetail < ApplicationRecord
  belongs_to :patient_details
end
