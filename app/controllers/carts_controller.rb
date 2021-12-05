class CartsController < ApplicationController
  def show
    @cart = []
    session[:cart].each do |cart|
      product = Product.find_by(id: cart["product_id"])
      @cart.push({ 
        product_id: product.id,
        product_name: product.product_name,
        category_name: product.category.category_name,
        price: product.price,
        quantity: cart["quantity"],
        sub_total: product.price * cart["quantity"]
        })
        @total_price = @cart.sum { |cart| cart[:sub_total]}
    end
  end

end
