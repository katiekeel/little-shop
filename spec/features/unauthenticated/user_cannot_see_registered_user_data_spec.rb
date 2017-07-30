describe "User is not logged in and" do
  scenario "cannot see order information" do
    visit "/orders"

    expect(current_path).to eq "/login"
    expect(page).to have_content "Please log in to your account to view your order details."

    visit '/cart'

    expect(page).to have_content "Login, or Create Account to Checkout"

    visit '/admin'

    expect(page).to have_button "Loggeth Thou In"
    expect(page).to_not have_content "Admin Dashboard"
  end
end
