class OrdersController < ApplicationController
  def show
    @order = Order.find_by(id: params[:id])
  end

  def create
    if session[:cart].blank?
      return redirect_to('/carts/show')
    end
    @order = current_user.orders.create(order_date: Time.now, order_number: rand(9999999999999999) )
    session[:cart].each do |cart|
      @order.order_details.create(
        product_id: cart["product_id"],
        shipment_status_id: 1,
        order_detail_number: rand(9999999999999999),
        order_quantity: cart["quantity"],
      )
    end
    session[:cart].clear
    redirect_to purchase_completed_path(order_id: @order.id)
  end

  def purchase_completed
    order_id = params[:order_id]
    @order = Order.find_by(id: params[:order_id])
  end
end
