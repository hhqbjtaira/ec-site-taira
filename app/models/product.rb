class Product < ApplicationRecord
  belongs_to :category_id
  belongs_to :sale_status_id
  belongs_to :product_status_id
  belongs_to :user_id
end
