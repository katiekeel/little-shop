RSpec.feature "User tried to go to admin dashboard" do
  scenario "gets a gangalfy 404 error" do
    # As a registered user
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    # When I visit "/admin/dashboard"
    visit admin_dashboard_path
    # I get a 404
    expect(page).to have_content("404")
    expect(page).to have_content("You shall not pass!")
save_and_open_page
    # As an unregistered user

    # When I visit "/admin/dashboard"

    # I get a 404



  end
end
