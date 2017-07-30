describe "User sees retired item and" do
  scenario "cannot add it to their cart" do
    item = create(:item, status: "retired")

    visit item_path(item)

    expect(current_path).to eq "/items/#{item.id}"
    expect(page).to have_content "#{item.title}"
    expect(page).to have_content "#{item.description}"

    expect(page).to_not have_button "Add to Cart"
    expect(page).to have_content "Item Retired"

    visit items_path

    expect(current_path).to eq "/items"
    expect(page).to have_content "#{item.title}"
    expect(page).to have_content "#{item.description}"

    expect(page).to_not have_button "Add to Cart"
    expect(page).to have_content "Item Retired"
  end
end
