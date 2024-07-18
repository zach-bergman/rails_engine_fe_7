require "rails_helper"

RSpec.describe "Item Show Page" do
  it "shows a list of items, each item links to show page", :vcr do
    visit item_path(4)

    expect(page).to have_content("Item Info:")

    within "#item_info" do
      expect(page).to have_content("Name: Item Nemo Facere")
      expect(page).to have_content("Description: Sunt eum id eius magni consequuntur delectus veritatis. Quisquam laborum illo ut ab. Ducimus in est id voluptas autem.")
      expect(page).to have_content("Unit Price: 42.91")
    end
  end
end