class UserClassification < ApplicationRecord
  has_many :users, dependent: :destroy

  validates :user_classification_name, presence: true
end
