class ChangePriceDueToMoneyRails < ActiveRecord::Migration[5.0]
  def change
    add_monetize :products, :price_cents, currency: { present: false }
  end
end
