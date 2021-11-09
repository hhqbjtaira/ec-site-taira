class ProductsController < ApplicationController
  def show
    @product = Product.find_by(id: params[:id])
    if @product.blank?
      redirect_to products_show_not_found_url
    end
  end

end
