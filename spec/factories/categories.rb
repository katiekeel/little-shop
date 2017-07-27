FactoryGirl.define do
  factory :category do
    sequence :title do |n|
      "My String#{n}"
    end
  end
end
