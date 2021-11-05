class User < ApplicationRecord
  has_secure_password
  
  belongs_to :user_classification
end
