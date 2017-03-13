class ProductsController < ApplicationController

  before_filter :authenticate_user!, only: [:profiles], except: [:index]

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
  end

  def edit
    @products = Product.find(params[:id])
    @product.edit(product_params)
    redirect_to admin_product_path(@product)
  end

  def update
    @products = Product.find(params[:id])
    @product.update(product_params)
    redirect_to admin_product_path(@product) #
  end

  def destroy
  end
end
