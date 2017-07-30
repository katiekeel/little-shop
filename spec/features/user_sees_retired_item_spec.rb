describe "User sees retired item and" do
  scenario "cannot add it to their cart" do
    item = create(:item, status: "retired")

    # As a user if I visit an item page and that item has been retired
    visit item_path(item)

    # Then I should still be able to access the item page
    expect(current_path).to eq "/items/#{item.id}"
    expect(page).to have_content "#{item.title}"
    expect(page).to have_content "#{item.description}"

    # And I should not be able to add the item to their cart
    # And I should see in place of the "Add to Cart" button or link - "Item Retired"
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
