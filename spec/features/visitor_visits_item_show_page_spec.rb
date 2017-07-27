RSpec.feature "when a visitor visits individual item page" do
  scenario "they see only that item" do
    item_1, item_2 = create_list(:item, 2)

    visit item_path(item_2)

    expect(page).to_not have_content(item_1.title)
    expect(page).to have_content(item_2.title)
    expect(page).to_not have_content(item_1.description)
    expect(page).to have_content(item_2.description)
    expect(page).to_not have_content(item_1.price)
    expect(page).to have_content(item_2.price)
    expect(page).to have_css("img", count:1)
  end
end
