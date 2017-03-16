class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  before_create :create_profile

  has_one :profile, dependent: :destroy
  has_many :products, dependent: :destroy
  has_many :orders, dependent: :destroy

  def to_s
     email
  end

  private

  def create_profile
    self.profile = Profile.new
  end

end
