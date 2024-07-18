require "rails_helper"

RSpec.describe "Merchants Index Page" do
  it "shows a list of merchants by name, each merchant's 
  name is a link to their show page", :vcr do
    visit merchants_path

    expect(page).to have_content("Merchants")

    within "#merchant-names" do
      expect(page).to have_link("Schroeder-Jerde", href: merchant_path(1))
      expect(page).to have_link("Klein, Rempel and Jones", href: merchant_path(2))
      expect(page).to have_link("Willms and Sons", href: merchant_path(3))
    end
  end
end