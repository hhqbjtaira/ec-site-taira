class OrdersController < ApplicationController
  before_action :logged_in_user
  before_action :correct_order, only: [:show]

  def show
    @order = Order.find_by(id: params[:id])
  end

  def index
    @orders = current_user.orders.page(params[:page]).per(15)
  end

  def create
    if session[:cart].blank?
      return redirect_to carts_show_path
    end

    order = current_user.orders.create!(order_date: Time.current, order_number: rand(9_999_999_999_999_999))
    session[:cart].each do |cart|
      order.order_details.create(
        product_id: cart["product_id"],
        shipment_status_id: 1,
        order_detail_number: rand(9_999_999_999_999_999),
        order_quantity: cart["quantity"],
      )
    end
    session[:cart].clear
    redirect_to purchase_completed_path(order_id: order.id)
  end

  def purchase_completed
    @order = Order.find_by(id: params[:order_id])
  end

  def destroy
    @order = Order.find_by(id: params[:id])
    order_preparing = @order.order_details.select {|order_detail| order_detail.shipment_status_id == 1 }
    @order.order_details.delete(order_preparing)
    redirect_to order_path
  end

  private

    def correct_order
      order = Order.find_by(id: params[:id])
      if current_user.id != order.user_id
        flash[:danger] = "他人の情報にアクセスすることはできません。"
        redirect_to root_path
      end
    end
end
