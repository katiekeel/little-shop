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
      item_1, item_2 = create_list(:item, 2, price: 5)
      user = create(:user)
      order_1, order_2 = create_list(:order, user_id: user.id, status: 3)
      create(:item_order, item: item_1, order: order_1, quantity: 1)
      create(:item_order, item: item_1, order: order_2, quantity: 1)
      create(:item_order, item: item_2, order: order_1, quantity: 2)
      create(:item_order, item: item_2, order: order_1, quantity: 2)
      create(:item_order, item: item_2, order: order_1, quantity: 2)
      create(:item_order, item: item_2, order: order_1, quantity: 2)
      create(:item_order, item: item_2, order: order_1, quantity: 2)

      expect(user.most_ordered_item).to eq item_2
    end
  end
end
