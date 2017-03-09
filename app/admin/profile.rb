ActiveAdmin.register Profile do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#

  form(:html => { :multipart => true }) do |f|
      f.inputs "Identity" do
        f.label "Profile Type "
        f.select :profile_type,["artist","client"]
        f.input :firstname
        f.input :lastname
        f.input :picture
        f.input :birth_date, as: :datepicker, datepicker_options: { min_date: "1920-10-8", max_date: "+3D", changeYear: true,  start_year: Time.now.year - 50, end_year: Time.now.year + 50}
        f.input :biography
      end


      f.inputs "Links" do
        f.input :user
      end

      f.inputs "Address" do
        f.input :address
        f.input :city
        f.input :country
      end
      f.inputs "Universe" do
       f.input :universe_name
       f.label "Universe Picture "
       f.file_field :universe_picture
      end
      f.actions
  end

  permit_params :profile_type, :firstname, :lastname, :picture, :birth_date, :biography, :address, :city, :country, :user_id, :universe_name, :universe_picture

# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

end
