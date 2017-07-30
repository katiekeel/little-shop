RSpec.feature "user can checkout" do
  scenario "from the cart path" do
    user = create(:user)
    item_1, item_2 = create_list(:item, 2)


    visit items_path

    within(".item-#{item_1.id}") do
      click_on("Add to Cart")
    end

    within(".item-#{item_2.id}") do
      click_on("Add to Cart")
    end

    click_link "Cart"

    expect(current_path).to eq(cart_path)
    expect(page).to have_content(item_1.title)
    expect(page).to have_content(item_2.title)


    within("nav") do
      click_link("Login")
    end

    fill_in "session_username", with: user.username
    fill_in "session_password", with: user.password
    click_button("Log In")

    expect(current_path).to eq("/dashboard")

    expect(page).to have_content("Logged in as #{user.username}")
    expect(page).to have_content user.username

    click_link "Cart"

    click_link "Checkout"

    expect(current_path).to eq(orders_path)
    expect(page).to have_content("Order was successfully placed")
    exepct(pave).to have_content("order-#{current_user.orders.last.id}")
  end
end