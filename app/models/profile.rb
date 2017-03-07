class Profile < ApplicationRecord
  belongs_to :user

  validates :profile_type, presence: true, inclusion: { in: ["client","artist"], allow_nil: false }
  validates :firstname, presence: true
  validates :lastname, presence: true
  validates :picture, presence: true
  validates :country, presence: true
end
