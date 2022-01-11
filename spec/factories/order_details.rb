FactoryBot.define do
  factory :order_detail do
    order_detail_number { "0123456" }
    order_quantity { 1 }
    shipment_date { DateTime.parse("1993-02-24T12:30:45") }
    association :product
    association :shipment_status
    association :order
  end
end
