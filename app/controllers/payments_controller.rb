class PaymentsController < ApplicationController
  before_action :set_order

  def new
  end

  def create
    customer = Stripe::Customer.create(
      source: params[:stripeToken],
      email:  params[:stripeEmail]
    )

    charge = Stripe::Charge.create(
      customer:     customer.id,   # You should store this customer id and re-use it.
      amount:       @order.amount_cents, # or amount_pennies
      description:  "Payment for product #{@order.product_sku} for order #{@order.id}",
      currency:     @order.amount.currency
    )

    @order.update(payment: charge.to_json, status: 'paid')
    redirect_to profile_orders_path(@order.artist.profile, @order)

  rescue Stripe::CardError => e
    #flash[:error] = e.message
    redirect_to new_profile_order_payment_path(@order)
  end

private

  def set_order
    @order = Order.where(status: 'purchase_request').find(params[:order_id])
  end
end
