class OrdersController < ApplicationController
  before_action :find_artist_profile, only: [:new, :edit, :update]
  layout "order_new", only: [ :new ]
  layout "order_index", only: [ :index ]

  def index
    @orders = Order.all.select{ |order| order.user == current_user || order.artist == current_user }
  end

  def show
  end

  def new
    @order = Order.new
    @client_user = User.find(current_user)
    @artist_user = User.find(@artist_profile.user)
    @product = Product.where(user_id: @artist_user.id)
  end

  def create
    @order = Order.new(order_params)
    @order.artist = Profile.find(params[:profile_id]).user
    @order.user = current_user
    @order.status = 'purchase_request'
    if @order.save
    else
      fail # need to manage errors
    end
    redirect_to profile_path(params[:profile_id])
  end

  def edit
  end

  def update
  end

  def destroy
    order = Order.find(params[:id])
    order.destroy
    redirect_to profile_orders_path(params[:profile_id])
  end

  private

  def find_artist_profile
    @artist_profile = Profile.find(params[:profile_id])
  end

  def order_params
    # *Strong params*: You need to *whitelist* what
    # can be updated by the user
    # Never trust user data!
    params.require(:order).permit(:status, :product_id, :offer_title, :offer_body, :offer_price)
  end
end
