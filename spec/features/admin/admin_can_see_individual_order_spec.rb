RSpec.feature "admin visits dashboard clicks on order" do
  scenario "and sees order show page" do
    admin = create(:user, role: "admin")
    user = create(:user, full_name: "Bilbo Baggins", address: "Hobbit Hole")
    item_1 = create(:item)
    item_2 = create(:item)
    order = create(:order, user: user)
    item_order_1 = create(:item_order, order: order, item: item_1, quantity: 1)
    item_order_2 = create(:item_order, order: order, item: item_2, quantity: 2)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
    #     As an authenticated Admin, when I visit an individual order page
    visit admin_dashboard_path

    click_on "order-#{order.id}"

# Then I can see the order's date and time.
    expect(page).to have_content(order.created_at)
# And I can see the purchaser's full name and address.
    expect(page).to have_content(user.full_name)
    expect(page).to have_content(user.address)
# And I can see, for each item on the order:
#
# The item's name, which is linked to the item page.
    expect(page).to have_link(item_1.title)
    expect(page).to have_link(item_2.title)

# Quantity in this order.
    expect(page).to have_content(item_order_1.quantity)
    expect(page).to have_content(item_order_2.quantity)

# Price
    expect(page).to have_content(item_1.price)
    expect(page).to have_content(item_2.price)
# Line item subtotal.
    expect(page).to have_content((item_2.price) * 2)
# And I can see the total for the order.
    expect(page).to have_content(order.total_price)
# And I can see the status for the order.
    expect(page).to have_content("Status: Ordered")
  end
end
