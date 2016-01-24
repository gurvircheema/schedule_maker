FactoryGirl.define do
  factory :user do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    contact { Faker::PhoneNumber.phone_number }
    email { Faker::Internet.email }
    type "employee"
  end

end
