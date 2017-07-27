RSpec.feature "Visitor deletes item from cart" do
  scenario "item is removed from cart" do
    item_1, item_2 = create_list(:item, 2)

    visit '/items'

    within(".item-#{item_1.id}") do
      click_on("Add to Cart")
    end

    within(".item-#{item_2.id}") do
      click_on("Add to Cart")
    end

    click_link "Cart"

    expect(current_path).to eq(cart_path)
    expect(page).to have_content(item_1.title)
    expect(page).to have_content(item_2.title)

    within(".item-#{item_1.id}") do
      click_button "Delete"
    end
    
    expect(current_path).to eq(cart_path)
    expect(page).to have_content("You have successfully removed #{item_1.title} from the cart.")
    expect(page).to have_link item_1.title, href: item_path(item_1)
    expect(page).to_not have_content(item_1.description)
    expect(page).to have_content(item_2.title)
  end
end
