class Merchant
  attr_reader :name, :id

  def initialize(merchant_data)
    @name = merchant_data[:attributes][:name]
    @id = merchant_data[:id] 
  end
end