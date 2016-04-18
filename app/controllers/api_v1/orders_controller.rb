class ApiV1::OrdersController < ApiController
  def index
    @orders = Order.page(params[:page])
  end
end
