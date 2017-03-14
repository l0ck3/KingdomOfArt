class Product < ApplicationRecord
  belongs_to :user
  has_many :orders
  validates :name, presence: true

  mount_uploader :picture, PictureUploader

  def to_s
    name
  end
end


