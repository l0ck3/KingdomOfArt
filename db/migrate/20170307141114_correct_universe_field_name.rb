class CorrectUniverseFieldName < ActiveRecord::Migration[5.0]
  def change
    remove_column :profiles, :unvierse_picture, :string
    add_column :profiles, :universe_picture, :string
  end
end
