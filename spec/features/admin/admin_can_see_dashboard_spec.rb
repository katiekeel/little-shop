RSpec.feature "Admin visits dashboard" do
  scenario "admin sees dashboard" do
    # As a logged in Admin
    user = create(:user, role: "admin")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    # When I visit "/admin/dashboard"
    visit admin_dashboard_path
    # I will see a heading on the page that says "Admin Dashboard"
    expect(page).to have_content("Admin Dashboard")
  end
end
