class Order < ApplicationRecord
  belongs_to :user
  has_many :order_details, dependent: :destroy

  def order_preparing
    order_details.any? { |order_detail| order_detail.shipment_status.shipment_status_name == "準備中" }
  end

  def total_price
    order_details.sum(&:subtotal_price)
  end
end
