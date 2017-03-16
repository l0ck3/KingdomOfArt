class AddStripeInfoToOrders < ActiveRecord::Migration[5.0]
  def change
    change_table :orders do |t|
      t.string :product_sku
      t.monetize :amount
      t.json :payment
    end
  end
end
