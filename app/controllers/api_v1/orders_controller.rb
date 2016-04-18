class ApiV1::OrdersController < ApplicationController
  def index
    @order = Order.page(params[:page])
  end
end
