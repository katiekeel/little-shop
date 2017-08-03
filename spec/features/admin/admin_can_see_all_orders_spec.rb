RSpec.feature "Admin visits dashboard and" do
  scenario "can see all orders" do
    admin = create(:user, role: "admin")
    user  = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
    ordered = create_list(:order, 5, user: user)
    paid = create_list(:order, 6, user: user, status: "paid")
    cancelled = create_list(:order, 7, user: user, status: "cancelled")
    completed = create_list(:order, 8, user: user, status: "completed")

    visit admin_dashboard_path
    expect(page).to have_content("All Orders (26)")
    expect(page).to have_link("order-#{Order.first.id}")
    expect(page).to have_link("order-#{Order.last.id}")
    expect(page).to have_content("Ordered (5)")
    expect(page).to have_content("Paid (6)")
    expect(page).to have_content("Cancelled (7)")
    expect(page).to have_content("Completed (8)")

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

    within("#ordered-orders") do
      click_link_or_button("Mark As Paid", :match => :first)
    end

    within("#paid-orders") do
      expect(page).to have_link "order-#{ordered.second.id}"
    end

    within("#paid-orders") do
      click_link_or_button("Mark As Completed", :match => :first)
    end

    within("#completed-orders") do
      expect(page).to have_content "order-#{paid.second.id}"
    end
  end
end
