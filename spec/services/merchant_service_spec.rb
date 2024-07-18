require "rails_helper"

RSpec.describe MerchantService do
  describe "initialize" do
    it "exists" do
      service = MerchantService.new
  
      expect(service).to be_a MerchantService
    end
  end

  describe "#conn" do
    it "creates a Faraday connection" do
      connection = MerchantService.new.conn

      expect(connection).to be_a Faraday::Connection
    end
  end

  describe "#get_url", :vcr do
    it "returns the results from the API call" do
      response = MerchantService.new.get_url("merchants")

      merchant_data = response[:data]

      expect(merchant_data).to be_an Array
      
      merchant_data.each do |merchant|
        expect(merchant).to have_key(:id)
        expect(merchant[:id]).to be_a String
        expect(merchant).to have_key(:type)
        expect(merchant[:type]).to eq("merchant")
        expect(merchant).to have_key(:attributes)
        expect(merchant[:attributes]).to be_a Hash
        expect(merchant[:attributes]).to have_key(:name)
        expect(merchant[:attributes][:name]).to be_a String
      end
    end
  end

  describe "#retrieve_merchants" do
    it "returns an array of merchants", :vcr do
      merchants = MerchantService.new.retrieve_merchants

      expect(merchants).to be_an Array

      merchants.each do |merchant|
        expect(merchant).to have_key(:id)
        expect(merchant[:id]).to be_a String
        expect(merchant).to have_key(:type)
        expect(merchant[:type]).to eq("merchant")
        expect(merchant).to have_key(:attributes)
        expect(merchant[:attributes]).to be_a Hash
        expect(merchant[:attributes]).to have_key(:name)
        expect(merchant[:attributes][:name]).to be_a String
      end
    end
  end

  describe "#search_merchant_by_name" do
    it "returns a Merchant object based on name search", :vcr do
      merchant = MerchantService.new.search_merchant_by_name("Schroeder-Jerde")
      
      expect(merchant).to have_key(:id)
      expect(merchant[:id]).to be_a String
      expect(merchant).to have_key(:type)
      expect(merchant[:type]).to eq("merchant")
      expect(merchant).to have_key(:attributes)
      expect(merchant[:attributes]).to be_a Hash
      expect(merchant[:attributes]).to have_key(:name)
      expect(merchant[:attributes][:name]).to be_a String
    end
  end
end