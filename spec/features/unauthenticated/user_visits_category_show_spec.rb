RSpec.feature "User visits category show page" do
  scenario "sees items assigned to category" do
    cat_1, cat_2 = create_list(:category, 2)
    item_1, item_2, item_3, item_4 = create_list(:item, 4)
    cat_1.items << [item_1, item_2]
    cat_2.items << [item_3, item_4]

    visit ("/#{cat_1.title.split.map(&:downcase)*' '.gsub!(' ', '%20')}")

    expect(page).to have_content(item_1.title)
    expect(page).to have_content(item_2.title)
    expect(page).to_not have_content(item_3.title)
    expect(page).to_not have_content(item_4.title)
    expect(page).to have_content(item_1.description)
    expect(page).to have_content(item_2.description)
    expect(page).to_not have_content(item_3.description)
    expect(page).to_not have_content(item_4.description)
    expect(page).to have_content(item_1.price)
    expect(page).to have_content(item_2.price)
    expect(page).to_not have_content(item_3.price)
    expect(page).to_not have_content(item_4.price)
    expect(page).to have_css("img", count: 4)
  end
end
