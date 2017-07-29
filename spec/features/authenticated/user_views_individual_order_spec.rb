RSpec.feature "User views individual order page" do
  scenario "sees individual order details" do
    item_1, item_2 = create_list(:item, 2)
    # Background: An existing user that has one previous order
    user = create(:user)
    order_1 = create(:order, user_id: user.id, status: "completed")
    create(:item_order, item: item_1, order: order_1, quantity: 3)
    create(:item_order, item: item_2, order: order_1, quantity: 2)
    # As an authenticated user
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    # When I visit "/orders"
    visit orders_path
    # Then I should see my past order
    expect(page).to have_content("order-#{order_1.id}")
    # And I should see a link to view that order
    click_on "order-#{order_1.id}"
    # And when I click that link
    #
    # Then I should see each item that was order with the quantity and line-item subtotals
    expect(page).to have_link(item_1.title)
    expect(page).to have_link(item_2.title)
    expect(page).to have_content("Quantity: 3")
    expect(page).to have_content("Quantity: 2")
    expect(page).to have_content("Subtotal: #{3 * item_1.price}")
    expect(page).to have_content("Subtotal: #{2 * item_1.price}")
    # And I should see links to each item's show page

    # And I should see the current status of the order (ordered, paid, cancelled, completed)
    expect(page).to have_content("status: completed")
    # And I should see the total price for the order
    expect(page).to have_content("Total Price: #{(3 * item_1.price) + (2 * item_1.price)}")
    # And I should see the date/time that the order was submitted
    expect(page).to have_content(order_1.created_at)
    # If the order was completed or cancelled
    # Then I should see a timestamp when the action took place
    expect(page).to have_content(order_1.updated_at)
  end
end
