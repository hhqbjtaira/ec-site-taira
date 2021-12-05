class OrdersController < ApplicationController
  def show
    @order = Order.find_by(id: params[:id])
  end

  def destroy
    @order = Order.find_by(id: params[:id])
    order_preparing = @order.order_details.select {|order_detail| order_detail.shipment_status_id == 1 }
    @order.order_details.delete(order_preparing)
    redirect_to order_path
  end
end
