RSpec.feature "a user can see their past orders" do
  scenario "when they visit /orders" do
    user = create(:user)
    order_1 = create(order, user_id: user.id)
    order_2 = create(order, user_id: user.id)
    order_3 = create(order, user_id: user.id)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit orders_path

    expect(page).to have_content("order-#{order_1.id}")
    expect(page).to have_content("order-#{order_2.id}")
    expect(page).to have_content("order-#{order_3.id}")
  end
end
