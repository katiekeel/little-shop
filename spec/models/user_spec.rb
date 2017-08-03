require 'rails_helper'

RSpec.describe User, type: :model do
  context "Validations" do
    it { should validate_presence_of(:username) }
    it { should validate_uniqueness_of(:username) }
    it { should validate_presence_of(:full_name)}
    it { should validate_presence_of(:address)}

  end

  context "relationships" do
    it {should have_many(:orders) }
  end

  context "instance methods" do
    it "most ordered item returns most orderd item for user" do
      item_1, item_2 = create_list(:item, 2)
      user_1 = create(:user)
      user_2 = create(:user)
      order_1, order_2 = create_list(:order, 2, user_id: user_1.id)
      order_3 = create(:order, user_id: user_2.id)
      create(:item_order, item: item_1, order: order_1, quantity: 5)
      create(:item_order, item: item_2, order: order_1, quantity: 4)
      create(:item_order, item: item_2, order: order_2, quantity: 2)
      create(:item_order, item: item_1, order: order_3, quantity: 20)
      create(:item_order, item: item_2, order: order_3, quantity: 15)

      expect(user_1.most_ordered_item).to eq item_2
    end
  end
end
