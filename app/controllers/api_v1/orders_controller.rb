class ApiV1::OrdersController < ApiController

  # before_action :user_approve!(:id => params[:id], :token => params[:id])

  def index
    @orders = Order.page(params[:page]).per(10)
  end

  def show
    @user = User.find(params[:id])

  end
  def create
  	puts "----------------------------------------------------------------"
  	puts params
  	order = Order.new(:owner_id=>params[:owner_id],:photo=>params[:photo],
  						:deliver_time=>params[:arrival_time], :pickup_addr=>params[:shop_addr], 
  						:deliver_addr=>params[:destination], :category=>params[:category]
				  		)
  	order.build_detail(:prepay=>params[:prepay],:fee=>params[:fee],:description=>params[:description])
  	u=User.find(order.owner_id)
  	order.detail.addressees_mobile=u.phone
  	order.detail.addressees_name=u.fullname

  	if order.save
  		render :json => { :message => "ok" }
  	else
		render :json => { :message => "fail" }  		
  	end
  end

end
