require 'rails_helper'

RSpec.describe Order, type: :model do
  context "relationships" do
    it {should belong_to(:user) }
    it {should have_many(:item_orders) }
    it {should have_many(:items) }
  end
  context "instance methods" do
    it ".total_price returns total price of order" do
      item_1, item_2 = create_list(:item, 2, price: 5)
      user = create(:user)
      order_1 = create(:order, user_id: user.id, status: 3)
      create(:item_order, item: item_1, order: order_1, quantity: 1)
      create(:item_order, item: item_2, order: order_1, quantity: 2)

      expect(order_1.total_price).to eq(15)
    end
  end
end
