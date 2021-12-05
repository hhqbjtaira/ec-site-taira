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

  def add_cart
    if session[:cart].blank?
      session[:cart] = [{ product_id: params[:product_id], quantity: params[:quantity].to_i }]
      return redirect_to('/carts/show')
    end
    duplication = session[:cart].select {|cart| cart["product_id"] == params[:product_id] }
    if duplication.present?
      duplication[0]["quantity"] += params[:quantity].to_i
    else
      session[:cart].push({ product_id: params[:product_id], quantity: params[:quantity].to_i })
    end
    redirect_to('/carts/show')
  end
end
