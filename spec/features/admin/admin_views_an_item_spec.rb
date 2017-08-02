describe "Admin views an individual item" do
  scenario "and sees its status and an edit button" do
    item_1, item_2 = create_list(:item, 2)
    admin = create(:user, role: "admin")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit admin_dashboard_path

    click_on "View Thine Items"

    expect(current_path).to eq("/admin/items")

    within("tbody tr[1]") do
      click_link("#{item_1.title}")
    end

    expect(current_path).to eq "/admin/items/#{item_1.id}"
    expect(page).to have_content item_1.status.capitalize
    expect(page).to have_link "Edit"
  end

  context "and clicks its edit button" do
    scenario "and is routed to its edit page" do
      item_1, item_2 = create_list(:item, 2)
      admin = create(:user, role: "admin")
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_dashboard_path

      click_on "View Thine Items"

      expect(current_path).to eq("/admin/items")

      within("tbody tr[1]") do
        click_link("Edit")
      end

      expect(current_path).to eq "/admin/items/#{item_1.id}/edit"
      expect(page).to have_content "Edit Thy Item"
    end
  end
end
