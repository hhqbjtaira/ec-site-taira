FactoryBot.define do
  factory :order do
    order_date { DateTime.parse("1993-02-24T12:30:45") }
    order_number { "1234123412341234" }
    association :user
  end
end
