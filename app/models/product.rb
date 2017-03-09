class Product < ApplicationRecord
  belongs_to :user
  has_many :orders

  validates :name, presence: true

  def to_s
    name
  end
end
