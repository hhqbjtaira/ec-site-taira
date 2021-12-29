FactoryBot.define do
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
end
