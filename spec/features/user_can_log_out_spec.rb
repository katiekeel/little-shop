RSpec.feature "User can log out of account" do
  scenario "they click logout button" do
    items = create_list(:item, 3)
    user = create(:user)

    visit "/"

    expect(page).to have_content("Login")

    click_link("Login")


    fill_in "session_username", with: user.username
    fill_in "session_password", with: user.password

    click_button("Log In")

    expect(page).to_not have_content("Login")

    click_on "Logout"

    expect(page).to have_content("Login")

    expect(page).to_not have_content("Logout")
  end
end
