class AddUniverseToProfile < ActiveRecord::Migration[5.0]
  def change
    add_column :profiles, :universe_name, :string
    add_column :profiles, :unvierse_picture, :string
  end
end
