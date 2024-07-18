class ItemsController < ApplicationController
  def index
    @facade = ItemFacade.new
  end

  def show
    @facade = ItemFacade.new.get_item_by_id(params[:id])
  end
end