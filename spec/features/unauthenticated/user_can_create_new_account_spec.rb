RSpec.feature "User can create new account" do
  scenario "user createth new account" do
    create_list(:item, 3)

    visit(root_path)

    expect(page).to have_link("Login")

    click_link("Login")

    expect(current_path).to eq(login_path)

    click_link("Createth Thine Account")

    fill_in "user[username]", with: "Bilbo"
    fill_in "user[password]", with: "Bilbo123"
    fill_in "user[password_confirmation]", with: "Bilbo123"

    click_button("Signeth Thou Up")

    expect(current_path).to eq(dashboard_path)

    expect(page).to have_content("Logged in as Bilbo")

    expect(page).to have_content("Bilbo's Hobbit Hole")

    expect(page).to_not have_link("Login")

    expect(page).to have_link("Logout")
  end
end
