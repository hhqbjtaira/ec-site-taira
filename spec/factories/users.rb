FactoryBot.define do
  factory :user do
    password { "qwerty" }
    last_name { "user0" }
    first_name { "user1" }
    zipcode { "731-3191" }
    prefecture { "広島県" }
    municipality { "広島市安佐南区" }
    address { "大塚東" }
    apartments { "1-1-1" }
    sequence(:email) {|n| "tester#{n}@example.com" }
    phone_number { "0821230001" }
    company_name { "株式会社aaa" }
    association :user_classification
  end
end
