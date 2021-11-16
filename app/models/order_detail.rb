class OrderDetail < ApplicationRecord
  belongs_to :product
  belongs_to :order
  belongs_to :shipment_status

  def subtotal
    product.price*order_quantity
  end
end
