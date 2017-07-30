describe "User visits dashboard spec and" do
  scenario "sees their profile information" do
    create_list(:item, 3)
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

  context "edits their account and" do
    scenario "is routed back to dashboard page" do
      create_list(:item, 3)
      user = create(:user)
      orders = create_list(:order, 3, :with_item_orders)
      user.orders << orders

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit '/dashboard'

      click_link "Edit Thine Account"

      expect(current_path).to eq "/edit_account"

      fill_in "user[username]", with: "Sparklepony"
      fill_in "user[password]", with: user.password
      fill_in "user[password_confirmation]", with: user.password

      click_button "Changeth Thine Account"

      expect(page).to have_content "Thine information has been updated!"

      expect(current_path).to eq "/dashboard"
    end
  end

  context "clicks link to see their orders and" do
    scenario "is routed to order index page" do
      create_list(:item, 3)
      user = create(:user)
      orders = create_list(:order, 3, :with_item_orders)
      user.orders << orders

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit '/dashboard'

      click_link "Orders Belonging to Thee"

      expect(current_path).to eq "/orders"
    end
  end

  context "deletes account and" do
    scenario "is routed back to home page" do
      create_list(:item, 3)
      user = create(:user)
      orders = create_list(:order, 3, :with_item_orders)
      user.orders << orders

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit '/dashboard'

      click_link "Delete Thine Account"

      expect(current_path).to eq "/"
    end
  end
end
