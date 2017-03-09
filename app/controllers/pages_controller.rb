class PagesController < ApplicationController

  skip_before_action :authenticate_user!, only: :index

  def index
    @profiles = Profile.all.select { |profile| profile.profile_type == "artist"}
  end
end
