RSpec.feature "User decreases cart quantity of item" do
  scenario "the change is reflected in the cart" do
    item_1 = create(:item, price: 1.00)
    visit '/items'
    click_button("Add to Cart")
    click_button("Add to Cart")
    click_link "Cart"

    expect(page).to have_content("Item Total: $2.00")
    expect(page).to have_content("Cart Total: $2.00")

    fill_in "quantity", with: "1"
    click_on "Update"

    expect(current_path).to eq(cart_path)

    within(".item-#{item_1.id}") do
      expect(page).to have_content("1")
    end
    expect(page).to have_content("Item Total: $1.00")
    expect(page).to have_content("Cart Total: $1.00")
  end
  scenario "the quantity of 0 removes item from cart" do
    item_1 = create(:item, price: 1.00)
    visit '/items'
    click_button("Add to Cart")
    click_button("Add to Cart")
    click_link "Cart"

    expect(page).to have_content("Item Total: $2.00")
    expect(page).to have_content("Cart Total: $2.00")

    fill_in "quantity", with: "0"
    click_on "Update"

    expect(current_path).to eq(cart_path)
    expect(page).to_not have_content(item_1.description)
    expect(page).to have_content("Cart Total: $0.00")
  end
end
