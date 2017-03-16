class ChangePriceName < ActiveRecord::Migration[5.0]
  def change
    rename_column :products, :price, :old_price
    remove_monetize :products, :price_cents, currency: { present: false }
    add_monetize :products, :price, currency: { present: false }
  end
end
