class ApiV1::OrdersController < ApiController
  before_action :user_approve!(:id=>params[],:token=>params[])
  def index
    @orders = Order.page(params[:page])
  end
  def show
    @user = User.find(params[:id])

  end


end
