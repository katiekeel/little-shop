RSpec.feature "User logs in to site" do
  scenario "and sees their dashboard" do
    items = create_list(:item, 3)
    user = create(:user)

    visit "/"


    expect(page).to have_content("Login")

    click_link("Login")


    fill_in "session_username", with: user.username
    fill_in "session_password", with: user.password

    click_button("Log In")

    expect(current_path).to eq("/dashboard")

    expect(page).to have_content("Logged in as #{user.username}")
    expect(page).to have_content user.username

    expect(page).to_not have_content("Login")

    expect(page).to have_link("Logout")
  end

  scenario "user receives error when inputs invalid password" do
      items = create_list(:item, 3)
      user = create(:user)

      visit "/"

      expect(page).to have_content("Login")

      click_link("Login")

      fill_in "session_username", with: user.username
      fill_in "session_password", with: "bad password"
      click_button("Log In")

      expect(page).to have_content("The password thou hast provided doeth not match. Please endeavour once more or createth thine account.")
    end

    scenario "enters invalid username" do
      items = create_list(:item, 3)
      user = create(:user)

      visit "/"

      expect(page).to have_content("Login")

      click_link("Login")

      fill_in "session_username", with: "bad username"
      fill_in "session_password", with: user.password
      click_button("Log In")

      expect(page).to have_content("We haveth no known user with that name. Please endeavour once more or createth thine account.")
    end
  end
