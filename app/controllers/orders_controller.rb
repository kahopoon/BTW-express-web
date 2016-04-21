class OrdersController < ApplicationController

  before_action :authenticate_user!, :except => [:index,:show]

  def index
      @orders = Order.page(params[:page]).per(10)

  end
  def show
      @order=Order.find(params[:id])
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

