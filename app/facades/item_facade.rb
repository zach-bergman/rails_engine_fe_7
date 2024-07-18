class ItemFacade
  attr_reader :items

  def initialize
    @service = ItemService.new
    @items = retreive_items_by_name
  end

  def retreive_items_by_name
    results = @service.retreive_items_by_name

    results.map { |item_data| Item.new(item_data) }
  end

  def get_item_by_id(id) # move id to initialize? - tried
      item_data = @service.get_item_by_id(id)
      Item.new(item_data)
  end
end