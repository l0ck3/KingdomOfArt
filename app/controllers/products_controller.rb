class ProductsController < ApplicationController

  before_filter :authenticate_user!, only: [:profiles], except: [:index]

  def index
    @products = Product.all
  end

  # question: doit-on créer et faire un lien avec une page présentant tous les produits ? a priori, non : pourquoi garder INDEX: pour avoir tous les id edes products ???

  def new
    @product = Product.new
  end

  def product_params
    params.require(:product).permit(:product, :description, :price, :picture, :picture_cache)
  end

  def create
    product.save(product_params)
  end

  def edit
    @product = Product.find(params[:id])
    @product.update(product_params)
    redirect_to product_path(@product)
  end

  def update
    @product = Product.find(params[:id])
    @product.update(product_params)
    redirect_to admin_product_path(@product)
  end

  def destroy
    product.destroy
  end

private

  def find_product
    @product = Product.find(params[:id])
  end

  def profile_params
    # *Strong params*: You need to *whitelist* what
    # can be updated by the user
    # Never trust user data!
    params.require(:profile).permit(:profile_type, :firstname, :lastname, :picture, :picture_cache, :birth_date, :biography, :address, :city, :country, :user_id, :universe_name, :universe_picture, :universe_picture_cache )
  end
end
