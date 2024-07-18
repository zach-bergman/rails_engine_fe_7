require "rails_helper"

RSpec.describe ItemService do
  describe "initialize" do
    it "exists" do
      service = ItemService.new
  
      expect(service).to be_a ItemService
    end
  end

  describe "#conn" do
    it "creates a Faraday connection" do
      connection = ItemService.new.conn

      expect(connection).to be_a Faraday::Connection
    end
  end

  describe "#get_url", :vcr do
    it "returns the results from the API call" do
      response = ItemService.new.get_url("items")

      item_data = response[:data]

      expect(item_data).to be_an Array
      
      item_data.each do |item|
        expect(item).to have_key(:id)
        expect(item[:id]).to be_a String

        expect(item).to have_key(:type)
        expect(item[:type]).to eq("item")

        expect(item).to have_key(:attributes)
        expect(item[:attributes]).to be_a Hash

        expect(item[:attributes]).to have_key(:name)
        expect(item[:attributes][:name]).to be_a String

        expect(item[:attributes]).to have_key(:description)
        expect(item[:attributes][:description]).to be_a String

        expect(item[:attributes]).to have_key(:unit_price)
        expect(item[:attributes][:unit_price]).to be_a Float

        expect(item[:attributes]).to have_key(:merchant_id)
        expect(item[:attributes][:merchant_id]).to be_an Integer
      end
    end
  end

  describe "#get_item_by_id" do
    it "returns an Item object", :vcr do
      item = ItemService.new.get_item_by_id("4")

      expect(item).to be_a Hash

      expect(item).to have_key(:id)
      expect(item[:id]).to be_a String

      expect(item).to have_key(:type)
      expect(item[:type]).to eq("item")

      expect(item).to have_key(:attributes)
      expect(item[:attributes]).to be_a Hash

      expect(item[:attributes]).to have_key(:name)
      expect(item[:attributes][:name]).to be_a String

      expect(item[:attributes]).to have_key(:description)
      expect(item[:attributes][:description]).to be_a String

      expect(item[:attributes]).to have_key(:unit_price)
      expect(item[:attributes][:unit_price]).to be_a Float

      expect(item[:attributes]).to have_key(:merchant_id)
      expect(item[:attributes][:merchant_id]).to be_an Integer
    end
  end
end