FactoryGirl.define do
  trait :with_orders do
    transient do
      order_count 3
    end

    after(:create) do |object, evaluator|
      object.orders << create_list(:order, evaluator.order_count)
    end
  end

  trait :with_item_orders do
    transient do
      item_order_count 3
    end

    after(:create) do |object, evaluator|
      object.item_orders << create_list(:item_order, evaluator.item_order_count)
    end
  end
end
