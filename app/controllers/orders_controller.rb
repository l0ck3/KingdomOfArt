class OrdersController < ApplicationController
  layout "lvl4_layout", only: [ :new, :edit, :index ]

  def index
    @artist_profile = Profile.find(params[:profile_id])
    @order_artist_user = User.find(@artist_profile.user)
    @orders = Order.all.select{ |order| order.user == current_user || order.artist == current_user }
  end

  def show
  end

  def new
    @artist_profile = Profile.find(params[:profile_id])
    order_artist_user = @artist_profile.user
    order_product = Product.find(params[:order][:product_id])

    @order = Order.new
    @order.artist = order_artist_user
    @order.user = current_user
    @order.product = order_product
    @order.product_sku = order_product.sku
    @order.amount_cents = order_product.price_cents
    @order.status = 'purchase_request'
  end

  def create
    artist_profile = Profile.find(params[:profile_id])

    order = Order.new(order_params)
    order.artist = artist_profile.user
    order.user = current_user
    if order.save!
      #redirect_to profile_path(params[:profile_id]) #old redirect
      redirect_to new_profile_order_payment_path(profile_id: order.artist.profile, order_id: order.id)
    else
      render :new
    end
  end

  def edit
    @order = Order.find(params[:id])
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    redirect_to profile_orders_path(params[:profile_id]) #List of orders
  end

  def destroy
    order = Order.find(params[:id])
    order.destroy
    redirect_to profile_orders_path(params[:profile_id]) #List of orders
  end

  private

  def order_params
    # *Strong params*: You need to *whitelist* what
    # can be updated by the user
    # Never trust user data!
    params.require(:order).permit(:status, :product_id, :offer_title, :offer_body, :offer_price, :amount_cents, :product_sku)
  end
end
