FactoryGirl.define do
  factory :user do
    role 0
    sequence :username do |n|
      "username#{n}"
    end
    address "123 Street"
    full_name "Frodo McBagins"
    password "MyString"
  end
end
