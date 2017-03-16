ActiveAdmin.register Order do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#

form do |f|
    f.inputs "Order" do
      f.label :status
      f.select :status,["purchase_request","offer_sent","offer_accepted","offer_rejected","paid","work_in_progress","work_done","work_sent","closed"]
      f.input :product_sku
      f.input :amount_currency
      f.input :amount_cents

    end
    f.inputs "Offer" do
      f.input :offer_title
      f.input :offer_body
      f.input :offer_price
    end
    f.inputs "Links" do
      f.input :user
      f.input :artist
      f.input :product
    end
    f.actions
  end

permit_params :status, :product_id, :user_id, :artist_id, :offer_title, :offer_body, :offer_price, :product_sku, :amount_currency, :amount_cents

# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end


end
