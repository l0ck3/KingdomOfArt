class Order < ApplicationRecord
  belongs_to :product, optional: true
  belongs_to :user
  belongs_to :artist, class_name: 'User', foreign_key: 'artist_id'

  # validates :status, presence: true, inclusion: { in: ["purchase_request","offer_sent","offer_accepted","offer_rejected","paid","work_in_progress","work_done","work_sent","closed"], allow_nil: false }

  after_initialize :set_defaults, unless: :persisted?

  def set_defaults
    self.status = 'purchase_request'
  end
end
