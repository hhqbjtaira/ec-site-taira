class ProductsController < ApplicationController
  def show
    @product = Product.find_by(id: params[:id])
  end

  def index
    @products = Product.search(params[:keyword], params[:category_id]).page(params[:page]).per(15)
  end
end
