require "rails_helper"

RSpec.describe Merchant do
  before(:each) do
    merchant_data = {
      attributes: {
        name: "Merchant Name"
      }
    }

    @merchant = Merchant.new(merchant_data)
  end

  it "exists and has a name" do
    expect(@merchant).to be_a(Merchant)
    expect(@merchant.name).to eq("Merchant Name")
  end
end