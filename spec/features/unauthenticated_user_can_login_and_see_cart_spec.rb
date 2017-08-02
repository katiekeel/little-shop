RSpec.feature "visitor can add items to cart and upon login" do
  scenario "cart will persist" do
    item_1, item_2 = create_list(:item, 2)

    visit '/items'

    within(".item-#{item_1.id}") do
      find(:css, ".index-cart").click
    end

    within(".item-#{item_2.id}") do
      find(:css, ".index-cart").click
    end
    click_link "Cart"

    expect(current_path).to eq(cart_path)
    expect(page).to have_content(item_1.title)
    expect(page).to have_content(item_2.title)
    expect(page).to_not have_link("Checkout")
    expect(page).to have_link("Login")

    click_on "Create Account"

    fill_in "user[username]", with: "Bilbo"
    fill_in "user[password]", with: "Bilbo123"
    fill_in "user[password_confirmation]", with: "Bilbo123"
    fill_in "user[full_name]", with: "Aragorn Elessar"
    fill_in "user[address]", with: "City of Gondor"

    click_button("Signeth Thou Up")

    visit cart_path

    expect(page).to have_content(item_1.title)
    expect(page).to have_content(item_2.title)
    expect(page).to_not have_link("Login")
    expect(page).to_not have_content("Create Account")
  end
end
