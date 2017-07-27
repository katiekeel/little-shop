describe "User visits items index page and" do
  it "adds item to cart" do
    item = create(:item)

    visit '/items'

    click_button("Add to Cart")

    click_link "Cart"

    expect(current_path).to eq "/cart"
    expect(page).to have_content item.title
    expect(page).to have_content item.description
    expect(page).to have_content item.price.to_f.round(2)
    expect(page).to have_css("img", count: 1)
    expect(page).to have_content "Cart Total: $#{item.price.to_f.round(2)}"
  end
end
