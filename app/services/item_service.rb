class ItemService
  def conn
    Faraday.new(url: "http://127.0.0.1:3000/api/v1/")
  end

  def get_url(url)
    response = conn.get(url)

    JSON.parse(response.body, symbolize_names: true)
  end

  def retreive_items_by_name
    get_url("items")[:data]
  end

  def get_item_by_id(id)
    get_url("items/#{id}")[:data]
  end
end