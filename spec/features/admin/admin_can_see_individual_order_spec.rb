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
    visit admin_dashboard_path
    first(:link, "order-#{order.id}").click

    expect(page).to have_content(order.created_at.to_formatted_s(:long))
    expect(page).to have_content(user.full_name)
    expect(page).to have_content(user.address)
    expect(page).to have_link(item_1.title)
    expect(page).to have_link(item_2.title)
    expect(page).to have_content(item_order_1.quantity)
    expect(page).to have_content(item_order_2.quantity)
    expect(page).to have_content(item_1.price)
    expect(page).to have_content(item_2.price)
    expect(page).to have_content((item_2.price) * 2)
    expect(page).to have_content(order.total_price)
    expect(page).to have_content("Status: Ordered")
  end
end
