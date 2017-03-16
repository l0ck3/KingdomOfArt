class AddStripeInfoToOrders2 < ActiveRecord::Migration[5.0]
  def change
    remove_monetize :orders, :amount, currency: { present: false }
  end
end
