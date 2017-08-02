RSpec.feature "Admin creates item" do
  scenario "with valid attributes" do
    cat_1, cat_2, cat_3 = create_list(:category, 3)
    admin = create(:user, role: "admin")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit new_admin_item_path

    fill_in "item_title", with: "the one ring"
    fill_in "item_description", with: "to rule them all"
    fill_in "item_price", with: 5.00
    check("item_category_ids_#{cat_2.id}")
    check("item_category_ids_#{cat_3.id}")
    fill_in "item_image_path", with: "https://vignette2.wikia.nocookie.net/lotr/images/5/54/Untitledjk.png"

    click_on "Create Item"

    expect(current_path).to eq("/admin/items")
    expect(page).to have_link("the one ring")
    expect(page).to have_content("to rule them all")
    expect(page).to have_content("Active")
    expect(page).to have_css("img", count:1)
  end
  scenario "with invalid attributes =(" do
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
