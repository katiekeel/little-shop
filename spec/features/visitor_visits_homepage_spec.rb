RSpec.feature "when a visitor visits the root path" do
  scenario "they can see the homepage" do
    item_1, item_2, item_3 = create_list(:item, 3)

    visit root_path

    expect(page).to have_content("About")
    expect(page).to have_content("for all your Middle Earth needs")
    expect(page).to have_css(".carousel")
  end
end
