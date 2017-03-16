class Artists::ProfilesController < ApplicationController
  layout "lvl3_layout"

  def show
    @profile = Profile.find(params[:id])
    @products = @profile.user.products
    @order = Order.new
    render 'profiles/show'
  end

end
