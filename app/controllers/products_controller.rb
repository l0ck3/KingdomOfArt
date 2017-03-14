class ProductsController < ApplicationController

  before_filter :authenticate_user!, only: [:profiles], except: [:index]

  def new
    @product = Product.new
  end

  def create
    product.save(product_params)
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    @product.update(product_params)
  end

  def destroy
    product.destroy
  end

private

  def find_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:description, :price, :picture, :picture_cache)
  end

end
