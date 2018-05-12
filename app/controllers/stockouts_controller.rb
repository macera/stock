class StockoutsController < ApplicationController
  def index
    @supplies = Supply.stockouts(params[:category_id])
  end
end
