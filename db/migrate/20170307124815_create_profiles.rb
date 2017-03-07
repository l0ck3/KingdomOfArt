class CreateProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :profiles do |t|
      t.string :profile_type
      t.string :firstname
      t.string :lastname
      t.string :picture
      t.date :birth_date
      t.text :biography
      t.string :address
      t.string :city
      t.string :country
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
