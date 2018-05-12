class AnalysisesController < ApplicationController
  def index
    @total_using_amount = Product.total_using_amount
    @total_purchased_amount = Product.total_purchased_amount(Time.now)
    @total_last_purchased_amount = Product.total_last_purchased_amount(Time.now)
  end
end
