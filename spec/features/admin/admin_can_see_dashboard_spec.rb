RSpec.feature "Admin visits dashboard" do
  scenario "admin sees dashboard" do

    user = create(:user, role: "admin")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit admin_dashboard_path

    expect(page).to have_content("Admin Dashboard")
  end

  scenario "admin visits dashbaord from root" do
    create_list(:item, 3)
    user = create(:user, role: "admin")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit root_path

    click_link "Dashboard"

    expect(page).to have_content("Admin Dashboard")
  end
end
