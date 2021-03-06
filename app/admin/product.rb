ActiveAdmin.register Product do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#

form do |f|
    f.inputs "Product" do
      f.input :name
      f.input :description
      f.input :picture
      f.input :old_price
      f.input :price_cents
      f.input :sku
    end

    f.inputs "Links" do
      f.input :user
    end

    f.actions
  end

permit_params :name, :description, :picture, :old_price, :user_id, :sku, :price_cents

index do
  id_column
  column :name
  column :sku
  column :picture
  column :price_cents
  actions
end
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end


end
