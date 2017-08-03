RSpec.feature "Admin logs in" do
  scenario "admin is logged in" do
    user = create(:user, role: "admin")
    
    visit login_path
    fill_in "session[username]", with: user.username
    fill_in "session[password]", with: user.password
    click_button "Loggeth Thou In"

    expect(current_path).to eq(admin_dashboard_path)
  end
end
