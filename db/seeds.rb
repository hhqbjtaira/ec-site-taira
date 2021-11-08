Category.create!(category_name: '家具')
2.times do |i|
  Product.create!(Product.create!(
    product_name: 'テーブル',
    category_id: 1,
    price: 10000,
    description: '商品説明',
    sale_status_id: 1,
    product_status_id: 1,
    regist_date:DateTime.parse('1993-02-24T12:30:45'),
    user_id: 1,
    delete_flag: false)
  end
end

SaleStatus.create!(sale_status_name: '準備中')
2.times do |i|
  Product.create!(Product.create!(
    product_name: 'テーブル',
    category_id: 1,
    price: 10000,
    description: '商品説明',
    sale_status_id: 1,
    product_status_id: 1,
    regist_date:DateTime.parse('1993-02-24T12:30:45'),
    user_id: 1,
    delete_flag: false)
  end
end

ProductStatuse.create!(product_status_name: '新品')
2.times do |i|
  Product.create!(Product.create!(
    product_name: 'テーブル',
    category_id: 1,
    price: 10000,
    description: '商品説明',
    sale_status_id: 1,
    product_status_id: 1,
    regist_date:DateTime.parse('1993-02-24T12:30:45'),
    user_id: 1,
    delete_flag: false)
  end
end

Product.create!(
  product_name: 'テーブル',
  category_id: 1,
  price: 1000,
  description: '商品説明',
  sale_status_id: 1,
  product_status_id: 1,
  regist_date:DateTime.parse('1993-02-24T12:30:45'),
  user_id: 1,
  delete_flag: )
2.times do |i|
  Purchas.create!(
    purchase_price: 10000,
    purchase_quantity: 1,
    purchase_company: '株式会社aaa',
    order_date:DateTime.parse('1993-02-24T12:30:45'),
    purchase_date:DateTime.parse('1993-02-24T12:30:45'),
    product_id: 1)
  end
end
