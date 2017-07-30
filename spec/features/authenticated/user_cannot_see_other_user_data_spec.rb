describe "User is logged in and" do
  scenario "can't see other users' data" do
    user = create(:user)
    user_2 = create(:user)

    order = create(:order, user: user)
    user.orders << order
    order_2 = create(:order, user: user_2)
    user_2.orders << order_2

    # As an Authenticated User
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    # I cannot view another user's private data (current or past orders, etc)
    visit '/orders'

    expect(page).to have_link("order-#{order.id}")
    expect(page).to_not have_link("order-#{order_2.id}")

    visit "/orders/#{order_2.id}"

    expect(current_path).to eq "/login"
    expect(page).to have_content "Please login appropriately to view that order."

    # I cannot view the administrator screens or use admin functionality
    # I cannot make myself an admin

  end
end
