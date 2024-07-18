require "rails_helper"

RSpec.describe "Search Index Page" do
  it "shows a form to search for a merchant by name", :vcr do
    visit search_path

    expect(page).to have_content("Search for a Merchant by Name")

    within "#search-form" do
      expect(page).to have_field("name")
      expect(page).to have_button("Search")
    end
  end

  it "shows the Merchant found by name search", :vcr do
    visit search_path

    fill_in "name", with: "Schroeder-Jerde"
    click_button "Search"

    expect(current_path).to eq(search_path)

    expect(page).to have_content("Merchant Name: Schroeder-Jerde")

  end
end