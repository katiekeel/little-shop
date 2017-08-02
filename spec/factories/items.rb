FactoryGirl.define do
  factory :item do

    sequence :title do |n|
      "title #{n}"
    end

    sequence :description do |n|
      "description #{n}"
    end

    sequence :price do |n|
      "#{n}.00"
    end

    image_path "https://vignette2.wikia.nocookie.net/lotr/images/5/54/Untitledjk.png"

  end
end
