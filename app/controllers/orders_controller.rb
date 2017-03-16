class OrdersController < ApplicationController
  layout "lvl4_layout", only: [ :new, :edit, :index ]

  def index
    @artist_profile = current_user.profile
    @order_artist_user = User.find(@artist_profile.user)
    @orders = Order.all.select{ |order| order.user == current_user || order.artist == current_user }
  end

  def show
  end

  def new
    order_product = Product.find(params[:product_id])
    @artist_profile = order_product.user.profile
    order_artist_user = @artist_profile.user

    @order = Order.new
    @order.artist = order_artist_user
    @order.user = current_user
    @order.product = order_product
    @order.product_sku = order_product.sku
    @order.amount_cents = order_product.price_cents
    @order.status = 'purchase_request'
  end

  def create
    order = Order.new(order_params)

    order.user = current_user
    order.artist = Product.find(order_params[:product_id]).user

    customer = Stripe::Customer.create(
      source: params[:stripeToken],
      email:  params[:stripeEmail]
    )

    charge = Stripe::Charge.create(
      customer:     customer.id,   # You should store this customer id and re-use it.
      amount:       order.amount_cents, # or amount_pennies
      description:  "Payment for product #{order.product_sku} for order #{order.id}",
      currency:     order.amount.currency
    )

    order.payment = charge.to_json
    order.status = 'paid'

    if order.save!
      redirect_to orders_path
    else
      render :new
    end

    rescue Stripe::CardError => e

  end

  def edit
    @order = Order.find(params[:id])
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    redirect_to profiles_orders_path #List of orders
  end

  def update_deliver
    @order = Order.find(params[:id])
    @order.status = 'delivered'
    @order.save!
    redirect_to orders_path #List of orders
  end

  def destroy
    order = Order.find(params[:id])
    order.destroy
    redirect_to orders_path #List of orders
  end

  private

  def order_params
    # *Strong params*: You need to *whitelist* what
    # can be updated by the user
    # Never trust user data!
    params.require(:order).permit(:status, :product_id, :offer_title, :offer_body, :offer_price, :amount_cents, :product_sku)
  end

  def set_order
    @order = Order.where(status: 'purchase_request').find(params[:order_id])
  end
end

