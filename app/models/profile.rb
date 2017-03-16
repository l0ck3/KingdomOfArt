class Profile < ApplicationRecord
  belongs_to :user

  validates :profile_type, presence: true, inclusion: { in: ["client","artist"], allow_nil: false }, if: :persisted?
  validates :firstname, presence: true, if: :persisted?
  validates :lastname, presence: true, if: :persisted?

  mount_uploader :picture, PictureUploader
  mount_uploader :universe_picture, UniversePictureUploader

  def to_s
    firstname.present? ? "#{firstname} #{lastname}" : user.email
  end

  def navbar_id
    self.firstname || self.user.email
  end
end
