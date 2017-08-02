RSpec.feature "Admin logs in" do
  scenario "admin is logged in" do
    # As an Admin
    user = create(:user, role: "admin")
    # When I log in
    visit login_path
    fill_in "session[username]", with: user.username
    fill_in "session[password]", with: user.password
    click_button "Loggeth Thou In"
    # Then I am redirected to "/admin/dashboard"
    expect(current_path).to eq(admin_dashboard_path)
  end
end
