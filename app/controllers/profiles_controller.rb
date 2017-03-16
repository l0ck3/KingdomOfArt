class ProfilesController < ApplicationController
  before_action :find_profile, only: [:new, :show, :edit, :update]
  layout "profile_edit", only: [ :edit ]

  def show
    @products = Product.all.select { |product| product.user == @profile.user }
    #@order = Order.new
    @client_user = User.find(current_user)
    @artist_user = @profile.user
  end

  def new

  end

  # def create
  #   if @profile.profile_type == nil
  #     @profile.profile_type = "client"
  #   end
  #   @profile.update_attributes(profile_params)
  #   fail
  #   redirect_to profiles_path
  # end

  def edit
    @products = Product.where(user_id: @profile.user)
  end

  def update
    if @profile.profile_type == nil
      @profile.profile_type = "client"
    end
    @profile.update(profile_params)
    @profile.save

    redirect_to profiles_path
  end

  private

  def find_profile
    @profile = current_user.profile
  end

  def profile_params
    # *Strong params*: You need to *whitelist* what
    # can be updated by the user
    # Never trust user data!
    params.require(:profile).permit(:profile_type, :firstname, :lastname, :picture, :picture_cache, :birth_date, :biography, :address, :city, :country, :user_id, :universe_name, :universe_picture, :universe_picture_cache )
  end
end
