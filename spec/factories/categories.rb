FactoryGirl.define do
  factory :category do
    sequence :title do |n|
      "MyString_#{n}"
    end
  end
end
