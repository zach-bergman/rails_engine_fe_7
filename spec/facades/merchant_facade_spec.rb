require "rails_helper"

RSpec.describe MerchantFacade do
  it "exists with no arguments passed" do
    facade = MerchantFacade.new

    expect(facade).to be_a(MerchantFacade)
  end

  describe "#retrieve_merchants_by_name" do
    it "returns an array of Movie objects", :vcr do
      facade = MerchantFacade.new

      expect(facade.merchants).to be_an(Array)

      facade.merchants.each do |merchant|
        expect(merchant).to be_a(Merchant)
      end
    end
  end

  describe "#get_merchant_by_id" do
    it "returns a Merchant object", :vcr do
      facade = MerchantFacade.new
      id = "1"
      
      expect(facade.get_merchant_by_id(id)).to be_an(Merchant)
    end
  end

  describe "#retrieve_merchant_items" do
    it "returns an array of Item objects", :vcr do
      facade = MerchantFacade.new
      id = "1"

      expect(facade.retrieve_merchant_items(id)).to be_an(Array)
      facade.retrieve_merchant_items(id).each do |item|
        expect(item).to be_an(Item)
      end
    end
  end

  describe "#search_merchant_by_name" do
    it "returns a Merchant object based on name search", :vcr do
      facade = MerchantFacade.new
      name = "Schroeder-Jerde"

      expect(facade.search_merchant_by_name(name)).to be_a(Merchant)
    end
  end
end