class ApiV1::OrdersController < ApiController

  # before_action :user_approve!(:id => params[:id], :token => params[:id])
  skip_before_action :authenticate_user_from_token => [:updatestatus]
  def index
    @orders = Order.page(params[:page]).order('created_at DESC').per(10)
  end

  def show
    @user = User.find(params[:id])

  end
  def updatestatus
    puts current_user.id
    msg=Msgqueue.find_by_owner_id(current_user.id)
    if msg
      o=Order.find(msg.order_id)
      if msg.goal=="token"
        str="有人接了你的訂單"
      elsif msg.goal=="giveup"
        str="有人放弃你的訂單"
      end
      msg.destroy
      render :json => {:msg => str, :url => order_path(o)}
    else
      render :json => {:msg => ""}
    end
  end
  def update  #PATCH    /api/v1/orders/:id
    #only take right now, should make cancel work later
    o=Order.find(params[:id])
    if params[:goal]=="giveup"&&current_user.id==o.courier_id
      o.courier_id=nil
      o.status="posted"
      o.save
      m=Msgqueue.find_by_order_id(o.id)
      if m
        m.goal="giveup"
      else
        m=Msgqueue.create!(:order_id=>o.id,:courier_id=>o.courier_id,:owner_id=>o.owner_id,:goal=>"giveup")
      end
      render :json => {:msg => "ok"}
    else
      puts "user "+current_user.id.to_s+" want to take order "+o.id.to_s
      if o.courier_id==nil
        o.courier_id=current_user.id
        o.status="go"
        o.save
        m=Msgqueue.create!(:order_id=>o.id,:courier_id=>o.courier_id,:owner_id=>o.owner_id,:goal=>"token")
        puts m.inspect
        render :json => {:msg => "ok"}
      else
        render :json => {:msg => "be token by other"}
      end
    end
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
