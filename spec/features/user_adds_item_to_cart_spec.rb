describe "User visits items index page and" do
  it "adds item to cart" do
    # As a visitor
    item = create(:item)
    # When I visit any page with an item on it
    visit '/items'
    # I should see a link or button for "Add to Cart"
    # When I click "Add to cart" for that item
    click_button("Add to Cart")
    # And I click a link or button to view cart
    click_link "Cart"
    # And my current path should be "/cart"
    expect(current_path).to eq "/cart"
    # And I should see a small image, title, description and price for the item I just added
    expect(page).to have_content item.title
    expect(page).to have_content item.description
    expect(page).to have_content item.price.to_f.round(2)
    expect(page).to have_css("img", count: 1)
    # And there should be a "total" price for the cart that should be the sum of all items in the cart
    expect(page).to have_content "Cart Total: $#{item.price.to_f.round(2)}"
  end
end
