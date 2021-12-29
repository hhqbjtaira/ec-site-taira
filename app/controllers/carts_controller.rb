class CartsController < ApplicationController
  def show
    @cart = []
    return if session[:cart].nil?

    session[:cart].each do |cart|
      product = Product.find_by(id: cart["product_id"])
      @cart.push({
        product_id: product.id,
        product_name: product.product_name,
        category_name: product.category.category_name,
        price: product.price,
        quantity: cart["quantity"],
        sub_total: product.price * cart["quantity"],
      })
    end
    @total_price = @cart.sum {|cart| cart[:sub_total] }
  end

  def add_cart
    if session[:cart].blank?
      session[:cart] = [{ product_id: params[:product_id], quantity: params[:quantity].to_i }]
      return redirect_to carts_show_path
    end
    duplication = session[:cart].select {|cart| cart["product_id"] == params[:product_id] }
    if duplication.present?
      duplication[0]["quantity"] += params[:quantity].to_i
    else
      session[:cart].push({ product_id: params[:product_id], quantity: params[:quantity].to_i })
    end
    redirect_to carts_show_path
  end

  # カート内商品削除
  def destroy
    array = session[:cart].each_index.select {|i| session[:cart][i]["product_id"] == params[:product_id] }
    session[:cart].delete_at(array[0])
    redirect_to carts_show_path
  end

  # カート内で数量変更
  def update
    array = session[:cart].each_index.select {|i| session[:cart][i]["product_id"] == params[:product_id] }
    session[:cart][array[0]]["quantity"] = params[:quantity].to_i
    redirect_to carts_show_path
  end
end
