FactoryGirl.define do
  factory :category do
    sequence :title do |n|
      "MyString #{n}"
    end
  end
end