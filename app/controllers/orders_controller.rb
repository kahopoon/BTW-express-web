class OrdersController < ApplicationController

  def index
    @orders = Order.page(params[:page])
  end

  def create
    @order = Order.new(order_params)
  end

private

  def order_params
    params.require(:order).permit( :owner_id )
  end

end
