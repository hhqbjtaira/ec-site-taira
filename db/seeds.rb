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
Category.create!(category_name: "文房具")

SaleStatus.create!(sale_status_name: "販売中")
SaleStatus.create!(sale_status_name: "売り切れ")

ProductStatus.create!(product_status_name: "新品")
ProductStatus.create!(product_status_name: "新品同様")

Product.create!(product_name: "テーブル",
               category_id: 1,
               price: 10000,
               description: "商品説明:木目を活かした、和室でも、洋室でも使えるナチュラルなローテーブルです",
               sale_status_id: 1,
               product_status_id: 1,
               regist_date:DateTime.parse('1993-02-24T12:30:45'),
               user_id: 1,
               delete_flag: false)

Product.create!(product_name: "椅子",
               category_id: 1,
               price: 5000,
               description: "商品説明:洗練されたモダンデザインのハイバックチェアです",
               sale_status_id: 1,
               product_status_id: 2,
               regist_date:DateTime.parse('1993-02-24T12:30:45'),
               user_id: 1,
               delete_flag: false)

Product.create!(product_name: "タンス",
               category_id: 1,
               price: 30000,
               description: "商品説明:上質な空間を作り上げる、プレミアムな多段衣類収納チェストです",
               sale_status_id: 2,
               product_status_id: 1,
               regist_date:DateTime.parse('1993-02-24T12:30:45'),
               user_id: 1,
               delete_flag: false)

Product.create!(product_name: "ベッド",
               category_id: 1,
               price: 40000,
               description: "商品説明:シンプルで使いやすいフランスベッドのマットレスベッドです",
               sale_status_id: 2,
               product_status_id: 2,
               regist_date:DateTime.parse('1993-02-24T12:30:45'),
               user_id: 1,
               delete_flag: false)

Purchase.create!(purchase_price: 70000,
                purchase_quantity: 5,
                purchase_company: "株式会社NI",
                order_date:DateTime.parse('1993-02-24T12:30:45'),
                purchase_date:DateTime.parse('1993-02-24T12:30:45'),
                product_id: 1)

Purchase.create!(purchase_price: 30000,
                purchase_quantity: 2,
                purchase_company: "株式会社DI",
                order_date:DateTime.parse('1993-02-24T12:30:45'),
                purchase_date:DateTime.parse('1993-02-24T12:30:45'),
                product_id: 2)

Order.create!(user_id: 1,
             order_date:DateTime.parse('1993-02-24T12:30:45')
             order_number: "1234123412341234")

Order.create!(user_id: 2,
             order_date:DateTime.parse('1994-02-25T12:30:45')
             order_number: "0123012301230123")

ShipmentStatus.create!(sale_status_name: "準備中")
ShipmentStatus.create!(sale_status_name: "発送済")

OrderDetail.create!(product_id: 1,
                   order_id: 1,
                   shipment_status_id: 1,
                   order_detail_number: "0123456",
                   order_quantity: 1,
                   shipment_date:DateTime.parse('1994-02-25T12:30:45'))

OrderDetail.create!(product_id: 2,
                   order_id: 1,
                   shipment_status_id: 1,
                   order_detail_number: "0123456",
                   order_quantity: 1,
                   shipment_date:DateTime.parse('1994-02-25T12:30:45'))

OrderDetail.create!(product_id: 3,
                   order_id: 1,
                   shipment_status_id: 1,
                   order_detail_number: "0123456",
                   order_quantity: 1,
                   shipment_date:DateTime.parse('1994-02-25T12:30:45'))

OrderDetail.create!(product_id: 4,
                   order_id: 1,
                   shipment_status_id: 1,
                   order_detail_number: "0123456",
                   order_quantity: 1,
                   shipment_date:DateTime.parse('1994-02-25T12:30:45'))

OrderDetail.create!(product_id: 1,
                   order_id: 2,
                   shipment_status_id: 2,
                   order_detail_number: "1234567",
                   order_quantity: 1,
                   Shipment_date:DateTime.parse('1994-02-26T12:30:45'))

OrderDetail.create!(product_id: 2,
                   order_id: 2,
                   shipment_status_id: 2,
                   order_detail_number: "1234567",
                   order_quantity: 1,
                   Shipment_date:DateTime.parse('1994-02-26T12:30:45'))

OrderDetail.create!(product_id: 3,
                   order_id: 2,
                   shipment_status_id: 2,
                   order_detail_number: "1234567",
                   order_quantity: 1,
                   Shipment_date:DateTime.parse('1994-02-26T12:30:45'))

OrderDetail.create!(product_id: 4,
                   order_id: 2,
                   shipment_status_id: 2,
                   order_detail_number: "1234567",
                   order_quantity: 1,
                   Shipment_date:DateTime.parse('1994-02-26T12:30:45'))
