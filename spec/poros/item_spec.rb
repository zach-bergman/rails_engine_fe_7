require "rails_helper"

RSpec.describe Item do
  before(:each) do
    item_data = {
      id: "1",
      attributes: {
        name: "Item Name",
        description: "Item Description",
        unit_price: 100.99,
        merchant_id: "1"
      }
    }

    @item = Item.new(item_data)
  end

  it "exists and has attributes" do
    expect(@item).to be_an(Item)
    expect(@item.id).to eq("1")
    expect(@item.name).to eq("Item Name")
    expect(@item.description).to eq("Item Description")
    expect(@item.unit_price).to eq(100.99)
    expect(@item.merchant_id).to eq("1")
  end
end