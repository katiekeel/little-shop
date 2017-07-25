require 'rails_helper'

RSpec.feature "when a visitor visits items index" do
  scenario "they can see all items" do
    item_1, item_2, item_3 = create_list(:item, 3)

    visit items_path

    save_and_open_page

    expect(page).to have_content(item_1.title)
    expect(page).to have_content(item_2.title)
    expect(page).to have_content(item_3.title)
    expect(page).to have_content(item_1.description)
    expect(page).to have_content(item_2.description)
    expect(page).to have_content(item_3.description)
    expect(page).to have_content(item_1.price)
    expect(page).to have_content(item_2.price)
    expect(page).to have_content(item_3.price)
    expect(page).to have_css("img", count:3)
  end
end
