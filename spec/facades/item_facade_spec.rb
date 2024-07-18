require "rails_helper"

RSpec.describe ItemFacade do
  it "exists with no arguments passed" do
    facade = ItemFacade.new

    expect(facade).to be_a(ItemFacade)
  end

  describe "#retrieve_items_by_name" do
    it "returns an array of Item objects", :vcr do
      facade = ItemFacade.new

      expect(facade.items).to be_an(Array)

      facade.items.each do |item|
        expect(item).to be_a(Item)
      end
    end
  end

  describe "#get_item_by_id" do
    it "returns an Item object", :vcr do
      facade = ItemFacade.new
      id = "4"
      
      expect(facade.get_item_by_id(id)).to be_an(Item)
    end
  end
end