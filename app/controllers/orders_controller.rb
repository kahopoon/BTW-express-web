class OrdersController < ApplicationController

  before_action :authenticate_user!, :except => [:index]

  def index
    @orders = Order.page(params[:page])
  end

  def create
    @order = Order.new(order_params)
    @order.build_detail
    @order.detail.build_pickup
    @order.detail.build_delivery
  end

private

  def order_params
    params.require(:order).permit( :owner_id, :owner_id, :courier_id, :status )
  end

end

