describe "User is not logged in and" do
  scenario "cannot see order information" do
    # As an Unauthenticated User
    # I cannot view another user's private data, such as current order, etc.
    visit "/orders"

    expect(current_path).to eq "/login"
    expect(page).to have_content "Please log in to your account to view your order details."

    # I should be redirected to login/create account when I try to check out.
    visit '/cart'

    expect(page).to have_content "Login, or Create Account to Checkout"

    # I cannot view the administrator screens or use administrator functionality.
    # I cannot make myself an administrator.

    visit '/admin'

    expect(page).to have_button "Log In"
    expect(page).to_not have_content "Admin Dashboard"
  end
end
