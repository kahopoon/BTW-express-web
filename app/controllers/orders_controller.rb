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
  end

  def create
    @order = Order.create!(order_params)
    @detail= @order.build_detail(detail_params)
    @detail.save

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
    params.require(:order).permit( :owner_id, :courier_id, :status, :photo )
  end

  def detail_params
    params.require(:order).require(:detail).permit( :weight, :fee )
  end


end

