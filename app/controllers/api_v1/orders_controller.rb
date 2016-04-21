class ApiV1::OrdersController < ApiController

  # before_action :user_approve!(:id => params[:id], :token => params[:id])

  def index
    @orders = Order.page(params[:page]).per(10)
  end

  def show
    @user = User.find(params[:id])

  end


end
