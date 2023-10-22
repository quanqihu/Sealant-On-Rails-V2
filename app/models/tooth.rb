# frozen_string_literal: true

class Tooth < ApplicationRecord
  belongs_to :patient
end
