UserClassification.create!(user_classification_name: "admin")
UserClassification.create!(user_classification_name: "general")
2.times do |i|
  User.create!(password: "qwerty",
              last_name: "user#{i}",
              first_name: "user#{i}",
              zipcode: "731-319#{i}",
              prefecture: "広島県",
              municipality: "広島市安佐南区",
              address: "大塚東",
              apartments: "1-1-#{i}",
              email: "a#{i}@example.com",
              phone_number: "082123000#{i}",
              user_classification_id: 1,
              company_name: "株式会社aaa")
end

Category.create!(category_name: "家具")
2.times do |i|
  Product.create!(product_name: "テーブル",
                 category_id: 1,
                 price: 10000,
                 description: "商品説明",
                 sale_status_id: 1,
                 product_status_id: 1,
                 regist_date:DateTime.parse('1993-02-24T12:30:45'),
                 user_id: 1,
                 delete_flag: false)
end

SaleStatus.create!(sale_status_name: "準備中")
2.times do |i|
  Product.create!(product_name: "テーブル",
                 category_id: 1,
                 price: 10000,
                 description: "商品説明",
                 sale_status_id: 1,
                 product_status_id: 1,
                 regist_date:DateTime.parse('1993-02-24T12:30:45'),
                 user_id: 1,
                 delete_flag: false)
end

ProductStatuse.create!(product_status_name: "新品")
2.times do |i|
  Product.create!(product_name: "テーブル",
                 category_id: 1,
                 price: 10000,
                 description: "商品説明",
                 sale_status_id: 1,
                 product_status_id: 1,
                 regist_date:DateTime.parse('1993-02-24T12:30:45'),
                 user_id: 1,
                 delete_flag: false)
end

Product.create!(product_name: "テーブル",
               category_id: 1,
               price: 1000,
               description: "商品説明",
               sale_status_id: 1,
               product_status_id: 1,
               regist_date:DateTime.parse('1993-02-24T12:30:45'),
               user_id: 1,
               delete_flag: false)
2.times do |i|
  Purchas.create!(purchase_price: 10000,
                 purchase_quantity: 1,
                 purchase_company: "株式会社aaa",
                 order_date:DateTime.parse('1993-02-24T12:30:45'),
                 purchase_date:DateTime.parse('1993-02-24T12:30:45'),
                 product_id: 1)
end

Purchas.create!(purchase_price: 10000,
               purchase_quantity: 1,
               purchase_company: "株式会社aaa",
               order_date:DateTime.parse('1993-02-24T12:30:45'),
               purchase_date:DateTime.parse('1993-02-24T12:30:45'),
               product_id: 1)
2.times do |i|
end
