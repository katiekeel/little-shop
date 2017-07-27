RSpec.feature "User increases cart quantity of item" do
  scenario "the change is reflected in the cart" do
    item_1 = create(:item, price: 1.00)
    visit '/items'
    click_button("Add to Cart")
    click_link "Cart"

    expect(page).to have_content("Item Total: $1.00")
    expect(page).to have_content("Cart Total: $1.00")

    fill_in "quantity", with: "2"
    click_on "Update"

    expect(current_path).to eq(cart_path)
    within(".quantity") do
      expect(page).to have_content("2")
    end
    expect(page).to have_content("Item Total: $2.00")
    expect(page).to have_content("Cart Total: $2.00")
  end
end
