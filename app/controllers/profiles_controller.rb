class ProfilesController < ApplicationController
  before_action :find_profile, only: [:show]

  def show
  end

  private

  def find_profile
    @profile = Profile.find(params[:id])
  end

  def profile_params
    # *Strong params*: You need to *whitelist* what
    # can be updated by the user
    # Never trust user data!
    params.require(:profile).permit(:profile_type, :firstname, :lastname, :picture, :picture_cache, :birth_date, :biography, :address, :city, :country, :user_id, :universe_name, :universe_picture, :universe_picture_cache )
  end
end
