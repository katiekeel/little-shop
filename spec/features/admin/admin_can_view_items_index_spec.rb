RSpec.feature "Admin clicks on view items link" do
  scenario "sees table with all item details" do
    item_1, item_2 = create_list(:item, 2)
    admin = create(:user, role: "admin")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit admin_dashboard_path

    click_on "View Thine Items"

    expect(current_path).to eq("/admin/items")

    within("tbody tr[1]") do
      expect(page).to have_link(item_1.title)
      expect(page).to have_content(item_1.description)
      expect(page).to have_content(item_1.status.capitalize)
      expect(page).to have_css("img", count:1)
    end

    within("tbody tr[2]") do
      expect(page).to have_link(item_2.title)
      expect(page).to have_content(item_2.description)
      expect(page).to have_content(item_2.status.capitalize)
      expect(page).to have_css("img", count:1)
    end
  end
end
