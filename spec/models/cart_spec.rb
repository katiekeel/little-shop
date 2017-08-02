require 'rails_helper'

RSpec.describe Cart do
  context "Relationships" do

    #RESERVED FOR LATER

  end

  context "instance methods" do
    before :each do
      @item_1, @item_2, @item_3 = create_list(:item, 3)
      @cart = Cart.new(nil)

      @cart.add_item(@item_1.id)
      @cart.add_item(@item_1.id)
      @cart.add_item(@item_2.id)
    end

    it "#add_item adds item to cart" do
      expected = {@item_1.id.to_s => 2, @item_2.id.to_s => 1}
      expect(@cart.contents).to eq(expected)
    end

    it "#total_price returns total cart price" do
      expected = @item_1.price * 2 + @item_2.price
      expect(@cart.total_price).to eq(expected)
    end
    it "#item_subtotal returns subtotal" do
      expected = @item_1.price * 2
      expect(@cart.item_subtotal(@item_1)).to eq(expected)
    end
    it "#delete_item removes item from content" do
      @cart.delete_item(@item_1.id)
      expected = {@item_2.id.to_s => 1}
      expect(@cart.contents).to eq(expected)
    end
  end
end
