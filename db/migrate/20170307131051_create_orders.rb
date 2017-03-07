class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.string :status
      t.references :product, foreign_key: true
      t.references :user, foreign_key: true
      t.integer :artist_id
      t.string :offer_title
      t.text :offer_body
      t.float :offer_price

      t.timestamps
    end
  end
end
