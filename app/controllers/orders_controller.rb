class OrdersController < ApplicationController
  def show
    @order = Order.find_by(id: params[:id])
  end

  def index
    @orders = current_user.orders.all.page(params[:page]).per(15)
  end
end
