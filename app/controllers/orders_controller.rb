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
  end

private

  def order_params
    params.require(:order).permit( :owner_id )
  end

end
