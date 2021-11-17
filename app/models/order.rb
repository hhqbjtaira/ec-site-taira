class Order < ApplicationRecord
  belongs_to :user
  has_many :order_details, dependent: :destroy

  def total_amount
    order_details.sum(&:subtotal)
  end
end
