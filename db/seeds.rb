# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
UserClassification.create(user_classification_name: "admin")
2.times do |i|
  User.create(password_digest: "qwerty",
              last_name: "user#{i}",
              first_name: "user#{i}",
              zipcode: "000-0000",
              prefecture: "aaa",
              municipality: "aaa",
              address: "aaa",
              apartments: "aaa",
              email: "a#{i}@example.com",
              phone_number: "0000",
              user_classification_id: 1,
              company_name: "aaa")
end
