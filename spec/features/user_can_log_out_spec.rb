RSpec.feature "User can log out of account" do
  scenario "they click logout button" do
    # As a logged in user
    create_list(:item, 3)
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    visit items_path

    expect(page).to_not have_content("Login")

    # When I click "Logout"
    click_on("Logout")

    # Then I should see see "Login"

    expect(page).to have_link("Login")

    # And I should not see "Logout"

    expect(page).to_not have_content("Logout")
  end
end
