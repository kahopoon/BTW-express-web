class ApiV1::DetailsController < ApiController

  def index
    render :json => { :message => "hugo is so hot" }
  end

end
