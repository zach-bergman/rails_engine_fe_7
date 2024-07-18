class SearchController < ApplicationController
  def index
    if params[:name]
      @facade = search_merchant
    end
  end

  private
  def search_params
    params.permit(:name, :min_price, :max_price)
  end

  def search_merchant
    MerchantFacade.new.search_merchant_by_name(search_params[:name])
  end

  # def search_items
  #   if params[:min_price] && params[:max_price]
  #   ItemFacade.new.search_items_by_name(params[:name])
  # end
end