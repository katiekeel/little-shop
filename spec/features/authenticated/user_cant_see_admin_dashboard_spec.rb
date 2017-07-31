RSpec.feature "User tried to go to admin dashboard" do
  scenario "gets a gangalfy 404 error" do

    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit admin_dashboard_path

    expect(page).to have_content("404")
    expect(page).to have_content("You shall not pass!")
  end
end
