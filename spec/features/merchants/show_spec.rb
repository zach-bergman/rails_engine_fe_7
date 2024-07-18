require "rails_helper"

RSpec.describe "Merchants Show Page" do
  it "shows that merchant's name and a list of items that merchant sells", :vcr do
    visit merchants_path

    click_link "Schroeder-Jerde"

    expect(current_path).to eq(merchant_path(1))
    
    expect(page).to have_content("Name: Schroeder-Jerde")

    within "#merchant-items" do
      expect(page).to have_content("Items:")
      expect(page).to have_content("Item Nemo Facere")
      expect(page).to have_content("Item Expedita Aliquam")
      expect(page).to have_content("Item Provident At")
    end
  end
end

# When I visit the merchants index page (/merchants)
# and I click a merchant's name
# I should be on page '/merchants/:id'
# And I should see that merchant's name and a list of items that merchant sells.