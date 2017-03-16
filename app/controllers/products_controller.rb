class ProductsController < ApplicationController

  layout "lvl3_layout", only: [ :new, :edit, :index ]

  before_filter :authenticate_user!, only: [:profiles], except: [:index]

  def index

    @products = Product.all.select{ |product| product.user == current_user }

  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    @product.user_id = current_user.id
    if @product.save
      redirect_to products_path
    else
      render :new
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    @product.update(product_params)
    redirect_to products_path
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
  end

  private

  def find_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :description, :price, :picture, :picture_cache)
  end

end
