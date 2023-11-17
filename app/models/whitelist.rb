# app/models/whitelist.rb
class Whitelist < ApplicationRecord
  validates :email, presence: true, uniqueness: true

  def admin?
    self.role == 'Admin'
  end

  has_many :users

end
