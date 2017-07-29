require 'rails_helper'

RSpec.describe ItemOrder, type: :model do
  context "Validations" do
    it { should validate_presence_of(:quantity) }
  end

  context "relationships" do
    it {should belong_to(:order) }
    it {should belong_to(:item) }
  end

  context "instance methods" do
    it ".subtotal should return subtotal for that item_order" do
      item_1, item_2 = create_list(:item, 2, price: 5)
      order_1 = create(:order)
      item_order_2 = create(:item_order, item: item_1, order: order_1, quantity: 1)
      item_order_2 = create(:item_order, item: item_2, order: order_1, quantity: 2)

      expect(item_order_2.subtotal).to eq(10)
    end
  end
end
