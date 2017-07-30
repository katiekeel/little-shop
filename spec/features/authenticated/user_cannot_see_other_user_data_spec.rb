describe "User is logged in and" do
  scenario "can't see other users' data" do
    user = create(:user)
    user_2 = create(:user)

    order = create(:order, user: user)
    order_2 = create(:order, user: user_2)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit '/orders'

    expect(page).to have_content("Order 1")
    expect(page).to_not have_content("Order 2")
  end
end
# As an Authenticated User
#
# I cannot view another user's private data (current or past orders, etc)
#
# I cannot view the administrator screens or use admin functionality
#
# I cannot make myself an admin
