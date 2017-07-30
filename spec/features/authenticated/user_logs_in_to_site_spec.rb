RSpec.feature "User logs in to site" do
  scenario "and sees their dashboard" do
    items = create_list(:item, 3)
    user = create(:user)

    visit "/"


    expect(page).to have_content("Login")

    click_link("Login")


    fill_in "session_username", with: user.username
    fill_in "session_password", with: user.password

    click_button("Loggeth Thou In")

    expect(current_path).to eq("/dashboard")

    expect(page).to have_content("Logged in as #{user.username}")
    expect(page).to have_content user.username

    expect(page).to_not have_content("Login")

    expect(page).to have_link("Logout")
  end
end
