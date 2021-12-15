FactoryBot.define do
  factory :order_detail do
    order_detail_number { "0123456" }
    order_quantity { 1 }
    shipment_date { DateTime.parse("1993-02-24T12:30:45") }
    association :product
    association :shipment_status
    association :order
  end

  factory :order do
    association :user
  end
  
  factory :shipment_status do
    shipment_status_name { "準備中" }
  end

  factory :product do
    product_name { "テーブル" }
    price { 10000 }
    description { "商品説明:木目を活かした、和室でも、洋室でも使えるナチュラルなローテーブルです" }
    regist_date { DateTime.parse("1993-02-24T12:30:45") }
    association :category
    association :sale_status
    association :user
    association :product_status
  end

  factory :product_status do
    product_status_name { "新品" }
  end
  
  factory :sale_status do
    sale_status_name { "販売中" }
  end

  factory :category do
    category_name { "家具" }
  end

  factory :user do
    password { "qwerty" }
    last_name { "user0" }
    first_name { "user1" }
    zipcode { "731-3191" }
    prefecture { "広島県" }
    municipality { "広島市安佐南区" }
    address { "大塚東" }
    apartments { "1-1-1" }
    sequence(:email) { |n| "tester#{n}@example.com" }
    phone_number { "0821230001" }
    company_name { "株式会社aaa" }
    association :user_classification
  end

  factory :user_classification do
    user_classification_name { "general" }
  end
end

# order_detail.build(
#   product_id: 1,
#   order_detail_number: "1234567890123456",
#   order_quantity: 1,
# )