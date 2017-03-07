class Product < ApplicationRecord
  belongs_to :user
  has_many :orders

  validates :name, presence: true
  validates :description, presence: true
  validates :picture, presence: true
  validates :price, presence: true
end
