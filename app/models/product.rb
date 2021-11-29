class Product < ApplicationRecord
  belongs_to :category
  belongs_to :sale_status
  belongs_to :product_status
  belongs_to :user
  has_many :purchases, dependent: :destroy
  has_many :order_details, dependent: :destroy
end

def self.search(keyword)
  if keyword.present?
    Product.where(["product_name LIKE ?", "%#{keyword}%"])
  else
    Product.all
  end
end
