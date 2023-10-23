# frozen_string_literal: true

json.array! @child_details, partial: 'child_details/child_detail', as: :child_detail
