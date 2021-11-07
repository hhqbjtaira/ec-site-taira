UserClassification.create!(user_classification_name: "admin")
UserClassification.create!(user_classification_name: "general")
2.times do |i|
  User.create!(password: "qwerty",
              last_name: "user#{i}",
              first_name: "user#{i}",
              zipcode: "731-319#{i}",
              prefecture: "広島県",
              municipality: "広島市安佐南区",
              address: "大塚東",
              apartments: "1-1-#{i}",
              email: "a#{i}@example.com",
              phone_number: "082123000#{i}",
              user_classification_id: 1,
              company_name: "株式会社aaa")
end
