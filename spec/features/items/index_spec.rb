require "rails_helper"

RSpec.describe "Items Index Page" do
  it "shows a list of items, each item links to show page", :vcr do
    visit '/items'

    expect(page).to have_content("Items:")

    within "#items" do
      expect(page).to have_link("Item Nemo Facere", href: item_path(4))
      expect(page).to have_link("Item Expedita Aliquam", href: item_path(5))
      expect(page).to have_link("Item Provident At", href: item_path(6))
    end
  end
end

# As a visitor,
# When I visit '/items'
# I should see a list of item names,
# and each name is a link to that item's show page (/items/:id),
# and when I click on that link, I am taken to that item's show page
# where I see the name of the item, its description, and unit price.