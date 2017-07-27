RSpec.feature "User logs in to site" do
  scenario "and sees their dashboard" do
    # As a registered user
    items = create_list(:item, 3)
    user = create(:user)

    # When I visit "/"
    visit "/"

    # Then I should see a link for "Login"

    expect(page).to have_content("Login")

    # And when I click "Login"
    click_link("Login")

    # And I should be on the "/login" page
    expect(current_path).to eq("/login")

    # And I should see a place to insert my credentials to login
    # And I fill in my desired credentials
    fill_in "session_username", with: user.username
    fill_in "session_password", with: user.password

    # And I submit my information
    click_button("Log In")

    # Then my current page should be "/dashboard"
    expect(current_path).to eq("/dashboard")

    # And I should see a message in the navbar that says "Logged in as SOME_USER"
    # And I should see my profile information
    expect(page).to have_content("Logged in as #{user.username}")
    expect(page).to have_content user.username

    # And I should not see a link for "Login"
    expect(page).to_not have_content("Login")

    # And I should see a link for "Logout"
    expect(page).to have_link("Logout")
  end
end
