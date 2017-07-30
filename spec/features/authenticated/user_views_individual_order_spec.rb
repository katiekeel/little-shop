RSpec.feature "User views individual order page" do
  scenario "sees individual order details" do
    item_1, item_2 = create_list(:item, 2)
    user = create(:user)
    order_1 = create(:order, user_id: user.id, status: 3, created_at: 1.week.ago)
    create(:item_order, item: item_1, order: order_1, quantity: 3)
    create(:item_order, item: item_2, order: order_1, quantity: 2)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit orders_path
    expect(page).to have_content("order-#{order_1.id}")
    click_on "order-#{order_1.id}"

    expect(page).to have_link(item_1.title)
    expect(page).to have_link(item_2.title)
    expect(page).to have_content("Quantity: 3")
    expect(page).to have_content("Quantity: 2")
    expect(page).to have_content("Subtotal: $#{3 * item_1.price}0")
    expect(page).to have_content("Subtotal: $#{2 * item_2.price}0")
    expect(page).to have_content("Status: completed")
    expect(page).to have_content("Total Price: $#{(3 * item_1.price) + (2 * item_2.price)}0")
    expect(page).to have_content(order_1.created_at.to_formatted_s(:long))
    expect(page).to have_content(order_1.updated_at.to_formatted_s(:long))
  end

  scenario "do not see updated_at date when status is cancelled or completed" do
    item_1, item_2 = create_list(:item, 2)
    user = create(:user)
    order_1 = create(:order, user_id: user.id, status: 1, created_at: 1.week.ago)
    create(:item_order, item: item_1, order: order_1, quantity: 3)
    create(:item_order, item: item_2, order: order_1, quantity: 2)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit orders_path
    expect(page).to have_content("order-#{order_1.id}")
    click_on "order-#{order_1.id}"
save_and_open_page
    expect(page).to have_content("Status: Paid")
    expect(page).to have_content(order_1.created_at.to_formatted_s(:long))
    expect(page).to_not have_content(order_1.updated_at.to_formatted_s(:long))
  end
end
