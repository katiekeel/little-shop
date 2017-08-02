describe "Admin edits an item" do
  context "with valid attributes" do
    scenario "and sees it on the admin items index" do

      item_1, item_2 = create_list(:item, 2)
      admin = create(:user, role: "admin")
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit '/admin/items'

      first(:button, "Edit").click

      expect(current_path).to eq "/admin/items/#{item_1.id}/edit"

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

  scenario "with invalid attributes - no title =(" do
    cat_1, cat_2, cat_3 = create_list(:category, 3)
    admin = create(:user, role: "admin")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit new_admin_item_path

    fill_in "item_description", with: "to rule them all"
    fill_in "item_price", with: 5.00
    check("item_category_ids_#{cat_2.id}")
    check("item_category_ids_#{cat_3.id}")
    fill_in "item_image_path", with: "https://vignette2.wikia.nocookie.net/lotr/images/5/54/Untitledjk.png"

    click_on "Create Item"

    expect(page).to have_content("Item not created. Please try again.")
  end

  scenario "with default image if they leave it blank" do
    cat_1, cat_2, cat_3 = create_list(:category, 3)
    admin = create(:user, role: "admin")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit new_admin_item_path

    fill_in "item_title", with: "the one ring"
    fill_in "item_description", with: "to rule them all"
    fill_in "item_price", with: 5.00
    check("item_category_ids_#{cat_2.id}")
    check("item_category_ids_#{cat_3.id}")

    click_on "Create Item"

    expect(page).to have_xpath("//img[contains(@src,'https://vignette2.wikia.nocookie.net/lotr/images/5/54/Untitledjk.png')]")
  end
end
