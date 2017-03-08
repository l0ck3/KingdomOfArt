class Profile < ApplicationRecord
  has_one :user

  validates :profile_type, presence: true, inclusion: { in: ["client","artist"], allow_nil: false }
  validates :firstname, presence: true
  validates :lastname, presence: true
end
