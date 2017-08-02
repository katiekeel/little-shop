describe "Admin edits an item" do
  context "with valid attributes" do
    scenario "and sees it on the admin items index" do
      # As an admin
      item_1, item_2 = create_list(:item, 2)
      admin = create(:user, role: "admin")
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
      # When I visit "admin/items"
      visit '/admin/items'
      # And I click "Edit"
      first(:link, "Edit").click
      # Then my current path should be "/admin/items/:ITEM_ID/edit"
      expect(current_path).to eq "/admin/items/#{item_1.id}/edit"
      # And I should be able to update title, description, image, and status
      fill_in "item[title]", with: "New title"
      fill_in "item[description]", with: "New description"
      fill_in "item[price]", with: 500.00
      fill_in "item[image_path]", with: "whatevs"
      select "retired", from: "item_status"

      click_button "Update Item"

      item = Item.find(item_1.id)

      expect(current_path).to eq(admin_items_path)
      expect(item.status).to eq("retired")
      expect(page).to have_content("New title")
      expect(page).to have_content("New description")
    end
  end
end
