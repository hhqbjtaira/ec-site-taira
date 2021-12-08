class OrdersController < ApplicationController
  before_action :logged_in_user
  before_action :correct_order, only: [:show]

  def show
    @order = Order.find_by(id: params[:id])
  end

  def index
    @orders = current_user.orders.page(params[:page]).per(15)
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
      if current_user.orders.none? {|current_order| current_order == order }
        flash[:danger] = "他人の情報にアクセスすることはできません。"
        redirect_to root_path
      end
    end
end
