class DetailsController < ApplicationController

  before_action :authenticate_user!


  def create
    @detail = Detail.new(detail_params)
  end



private

  def detail_params
    params.require(:detail).permit( :order_id, :fee, :prepay)
  end


end
