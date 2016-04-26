class OrdersController < ApplicationController

  before_action :authenticate_user!, :except => [:index,:show]

  def index
      @orders = Order.page(params[:page]).per(10)

  end
  def show
      @order= Order.find(params[:id])
  end

  def new
    @order = Order.new
    @order.build_detail
  end

  def create
    @order = Order.create(order_params)

    if @order.save
      redirect_to order_url(@order)
    else
      render 'new'
    end
  end

  # def update
  #   if params[:destory_photo]
  #   @order.photo = nil
  # end

  #   if @order.update( order_params )
  #     redirect_to order_url(@order)
  #   else
  #     render "edit"
  #   end
  # end

private

  def order_params
    params.require(:order).permit( :pickup_time, :deliver_time, :pickup_addr, :deliver_addr, :category, :owner_id, :courier_id, :status, :photo, detail_attributes:[:prepay, :fee, :addressees_mobile, :addressees_name, :description] )
  end


end

