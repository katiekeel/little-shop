describe "User visits dashboard spec and" do
  scenario "sees their profile information" do
    user = create(:user)
    orders = create_list(:order, 3, :with_item_orders)
    user.orders << orders

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit '/dashboard'

    click_link "Profile"

    expect(page).to have_content "Username: #{user.username}"
    expect(page).to have_content "Anduin Member Since: #{user.created_at.to_formatted_s(:long)}"
    expect(page).to have_link "Edit Thine Account"
  end
end
