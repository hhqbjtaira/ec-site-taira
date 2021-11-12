class User < ApplicationRecord
  has_secure_password
  VALID_PASSWORD_REGEX = /\A[\w+\-.]+\z/.freeze
  VALID_ZIPCODE_REGEX = /\A\d{3}-\d{4}\z/.freeze
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze
  VALID_PHONE_NUMBER_REGEX = /\A[0-9]+\z/.freeze
  belongs_to :user_classification
  has_many :orders, dependent: :destroy

  with_options presence: true do
    validates :password, length: { in: 6..15 }, format: { with: VALID_PASSWORD_REGEX }
    validates :last_name, length: { maximum: 10 }
    validates :first_name, length: { maximum: 10 }
    validates :zipcode, format: { with: VALID_ZIPCODE_REGEX }
    validates :prefecture, length: { maximum: 5 }
    validates :municipality, length: { maximum: 10 }
    validates :address, length: { maximum: 15 }
    validates :apartments, length: { maximum: 20 }
    validates :email, format: { with: VALID_EMAIL_REGEX }, uniqueness: true
    validates :phone_number, length: { maximum: 15 }, format: { with: VALID_PHONE_NUMBER_REGEX }
  end
end
