class MerchantsController < ApplicationController
  def index
    @facade = MerchantFacade.new
  end

  def show
    @facade = MerchantFacade.new
    @merchant = @facade.get_merchant_by_id(params[:id])
    @items = @facade.retrieve_merchant_items(params[:id])
  end
end