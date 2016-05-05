class ApiV1::AuthController < ApiController

  before_action :authenticate_user!, :only => [:logout]

  def login
    success = false
    old_count=User.count
    if params[:email] && params[:password]
      user = User.find_by_email( params[:email] )
      success = user && user.valid_password?( params[:password] )
    elsif params[:access_token]&&params[:fb_uid]&&params[:email]
# use access_token to get data from fb
      # fb_data = User.get_fb_data( params[:access_token] )
      # if fb_data
      #   auth_hash = OmniAuth::AuthHash.new({
      #     uid: fb_data["id"],
      #     info: {
      #       email: fb_data["email"]
      #     },
      #     credentials: {
      #       token: params[:access_token]
      #     }
      #   })
      #   user = User.from_omniauth(auth_hash)
      # end
      puts "got it"      
      auth_hash = OmniAuth::AuthHash.new({
        uid: params[:fb_uid],
        info: {
          email: params[:email]
        },
        credentials: {
          token: params[:access_token]
        }
      })
      user = User.from_omniauth(auth_hash)
      success = user.persisted?
    end
    puts "find user.id == "+user.id.to_s
    if success
      uid=user.id      
      if User.count>old_count
        uid=0
        render :json => { :auth_token => user.authentication_token,
                        :user_id => uid}      
      else
        render :json => { :auth_token => user.authentication_token,
                        :user_id => uid, :phone=>user.phone, 
                        :introduction=>user.introduction,:fullname=>user.fullname}
      end

    else
      render :json => { :message => "email or password is not correct" }, :status => 401
    end

  end

  def logout
    user = current_user

    user.generate_authentication_token
    user.save!

    render :json => { :message => "ok" }
  end

  def write_profile 
    user=current_user
    puts user.id
    if params[:phone]&&params[:introduction]&&params[:fullname]
      user.phone=params[:phone]
      user.introduction=params[:introduction]
      user.fullname=params[:fullname]
      if user.save
        render :json => { :save=>true, :user_id => user.id, :phone=>user.phone, 
          :introduction=>user.introduction,:fullname=>user.fullname  }      
      end
    else
      render :json => { :save=>false }
    end
  end
  def read_profile
    render :json => { :message => "ok" }    
  end

end
