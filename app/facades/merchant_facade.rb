class MerchantFacade
  attr_reader :merchants

  def initialize
    @service = MerchantService.new
    @merchants = retrieve_merchants
  end

  def retrieve_merchants
    results = @service.retrieve_merchants

    results.map { |merchant_data| Merchant.new(merchant_data) }
  end

  def get_merchant_by_id(id)
    merchant_data = @service.retrieve_merchant_by_id(id)
    Merchant.new(merchant_data)
  end

  def retrieve_merchant_items(id)
    items = @service.retrieve_merchant_items(id)
    items.map { |item| Item.new(item) }
  end

  def search_merchant_by_name(name)
    merchant_data = @service.search_merchant_by_name(name)

    Merchant.new(merchant_data)
  end
end