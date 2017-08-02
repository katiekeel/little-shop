FactoryGirl.define do
  factory :user do
    role 0
    sequence :username do |n|
      "username#{n}"
    end
    password "MyString"
  end
end
