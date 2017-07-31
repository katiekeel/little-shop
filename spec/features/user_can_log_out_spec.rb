RSpec.feature "User clicks log out button" do
  scenario "from dasboard and are logged out" do
    items = create_list(:item, 3)
    user = create(:user)

    visit "/"

    expect(page).to have_content("Login")

    click_link("Login")
    fill_in "session_username", with: user.username
    fill_in "session_password", with: user.password
    click_button("Loggeth Thou In")

    expect(page).to_not have_content("Login")

    click_on "Logout"

    expect(page).to have_content("Login")
    expect(page).to_not have_content("Logout")
  end
end
