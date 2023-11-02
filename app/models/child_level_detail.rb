class ChildLevelDetail < ApplicationRecord
    belongs_to :patient_detail, foreign_key: 'PID', primary_key: 'PID'
end
