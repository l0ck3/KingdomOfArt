class Profile < ApplicationRecord
  belongs_to :user

  validates :profile_type, presence: true, inclusion: { in: ["client","artist"], allow_nil: false }
  validates :firstname, presence: true
  validates :lastname, presence: true

  mount_uploader :picture, PictureUploader
  mount_uploader :universe_picture, PictureUploader


  def to_s
    firstname + " " + lastname
  end
end
