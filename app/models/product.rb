class Product < ApplicationRecord
  belongs_to :user
  has_many :orders

  validates :name, presence: true

  mount_uploader :picture, PictureUploader
  monetize :price_cents  # or :price_pennies

  def to_s
    name
  end
end
