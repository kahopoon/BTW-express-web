class ApiV1::DetailsController < ApiController

  def index
    render :json => { :message => "hugo is so hot" }
  end
  def show
  	o_id=params[:o_id].split('o').last
  	@detail=Order.find(o_id).detail
  end
end
