class MerchantService
  def conn
    Faraday.new(url: "http://127.0.0.1:3000/api/v1/")
  end

  def get_url(url)
    response = conn.get(url)

    JSON.parse(response.body, symbolize_names: true)
  end

  def retrieve_merchants
    get_url("merchants")[:data]
  end

  def retrieve_merchant_by_id(id)
    get_url("merchants/#{id}")[:data]
  end

  def retrieve_merchant_items(id)
    get_url("merchants/#{id}/items")[:data]
  end

  def search_merchant_by_name(name)
    get_url("merchants/find?name=#{name}")[:data]
  end
end