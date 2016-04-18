class DetailsController < ApplicationController
  def create
    @detail = Detail.new(detail_params)
  end



private

  def detail_params
    params.require(:detail).permit( :order_id, :fee )
  end


end
