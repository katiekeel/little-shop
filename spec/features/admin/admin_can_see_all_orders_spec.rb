RSpec.feature "Admin visits dashboard" do
  scenario "can see all orders" do
    # As an Admin
    admin = create(:user, role: "admin")
    user  = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
    create_list(:order, 5, :with_item_orders, user: user)
    create_list(:order, 6, :with_item_orders, user: user, status: "paid")
    create_list(:order, 7, :with_item_orders, user: user, status: "cancelled")
    create_list(:order, 8, :with_item_orders, user: user, status: "completed")

    # When I visit the dashboard
    visit admin_dashboard_path
    # Then I can see a listing of all orders
    expect(page).to have_content("All Orders (26)")
    expect(page).to have_link("order-#{Order.first.id}")
    expect(page).to have_link("order-#{Order.last.id}")
    # And I can see the total number of orders for each status ("Ordered", "Paid", "Cancelled", "Completed")
    expect(page).to have_content("Ordered (5)")
    expect(page).to have_content("Paid (6)")
    expect(page).to have_content("Cancelled (7)")
    expect(page).to have_content("Completed (8)")

    # And I can see a link for each individual order

    # And I can filter orders to display by each status type ("Ordered", "Paid", "Cancelled", "Completed")

    # And I have links to transition between statuses

    # I can click on "cancel" on individual orders which are "paid" or "ordered"

    # I can click on "mark as paid" on orders that are "ordered"

    # I can click on "mark as completed" on orders that are "paid"





  end
end
