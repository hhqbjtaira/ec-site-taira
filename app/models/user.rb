class User < ApplicationRecord
  VALID_PASSWORD_REGEX = /\A[a-zA-Z0-9-]+\z/
  belongs_to :user_classification

  with_options presence: true do
    VALID_PASSWORD_REGEX = /\A[a-z0-9]+\z/i
    validates :password, length: { in: 6..15 }, format: { with: VALID_PASSWORD_REGEX }
    validates :last_name, length: { maximum: 10 }
    validates :first_name, length: { maximum: 10 }
    VALID_ZIPCODE_REGEX = /\A\d{3}[-]\d{4}\z/
    validates :zipcode, format: { with: VALID_ZIPCODE_REGEX }
    validates :prefecture, length: { maximum: 5 }
    validates :municipality, length: { maximum: 10 }
    validates :address, length: { maximum: 15 }
    validates :apartments, length: { maximum: 20 }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, format: { with: VALID_EMAIL_REGEX }, uniqueness: true
    validates :phone_number, length: { maximum: 15 }, format: { with: /\A[0-9]+\z/ }
  end

end
