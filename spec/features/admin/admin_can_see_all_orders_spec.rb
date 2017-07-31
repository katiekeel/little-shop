RSpec.feature "Admin visits dashboard and" do
  scenario "can see all orders" do
    # As an Admin
    admin = create(:user, role: "admin")
    user  = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
    ordered = create_list(:order, 5, user: user)
    paid = create_list(:order, 6, user: user, status: "paid")
    cancelled = create_list(:order, 7, user: user, status: "cancelled")
    completed = create_list(:order, 8, user: user, status: "completed")

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
    within("#orders") do
      expect(page).to have_link("order-#{Order.first.id}")
    end

    within("#ordered-orders") do
      expect(page).to have_link("order-#{ordered.first.id}")
    end

    within("#paid-orders") do
      expect(page).to have_link("order-#{paid.first.id}")
    end

    within("#cancelled-orders") do
      expect(page).to have_link("order-#{cancelled.first.id}")
    end

    within("#completed-orders") do
      expect(page).to have_link("order-#{completed.first.id}")
    end
  end

  scenario "can change order status" do
    admin = create(:user, role: "admin")
    user  = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
    ordered = create_list(:order, 5, user: user)
    paid = create_list(:order, 6, user: user, status: "paid")
    cancelled = create_list(:order, 7, user: user, status: "cancelled")
    completed = create_list(:order, 8, user: user, status: "completed")

    visit admin_dashboard_path

    # I can click on "cancel" on individual orders which are "paid" or "ordered"
    within("#paid-orders") do
      click_link_or_button("Cancel", :match => :first)
    end

    within("#cancelled-orders") do
      expect(page).to have_link "order-#{paid.first.id}"
    end

    within("#ordered-orders") do
      click_link_or_button("Cancel", :match => :first)
    end

    within("#cancelled-orders") do
      expect(page).to have_link "order-#{ordered.first.id}"
    end

    # I can click on "mark as paid" on orders that are "ordered"
    within("#ordered-orders") do
      click_link_or_button("Mark As Paid", :match => :first)
    end

    within("#paid-orders") do
      expect(page).to have_link "order-#{ordered.second.id}"
    end

    # I can click on "mark as completed" on orders that are "paid"
    within("#paid-orders") do
      click_link_or_button("Mark As Completed", :match => :first)
    end

    within("#completed-orders") do
      expect(page).to have_content "order-#{paid.second.id}"
    end
  end
end
