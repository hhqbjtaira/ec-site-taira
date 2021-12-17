FactoryBot.define do
  factory :order do
    order_date { DateTime.parse("1993-02-25T12:30:45") }
    order_number { "0123012301230123" }
    association :user
  end
end
