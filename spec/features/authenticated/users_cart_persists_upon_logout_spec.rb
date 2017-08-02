RSpec.feature "cart persists" do
  scenario "after user logs out" do
    user = create(:user)
    item_1, item_2, item_3 = create_list(:item, 3)

    visit root_path

    within("nav") do
      click_link("Login")
    end

    fill_in "session_username", with: user.username
    fill_in "session_password", with: user.password
    click_button("Loggeth Thou In")

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

    click_link "Logout"

    expect(current_path).to eq(root_path)
    expect(page).to have_content("Login")

    within("nav") do
      click_link("Login")
    end

    fill_in "session_username", with: user.username
    fill_in "session_password", with: user.password
    click_button("Loggeth Thou In")

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
  end
end
