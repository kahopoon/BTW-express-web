class UsersController < ApplicationController

  def show
    if current_user
      @user=current_user
    else
      @user=User.first
    end
    @role=params[:role]
    #owner -> show tooken with new / old
    @owner_post=Order.listorder(@user.id,'owner',"posted")
    @owner_old=Order.listorder(@user.id,'owner',"done")
    @owner_go=Order.listorder(@user.id,'owner',"go")
    # @own_list=Order.where(:owner_id=>@user.id)
    @courier_old=Order.listorder(@user.id,'courier',"done")
    @courier_go=Order.listorder(@user.id,'courier',"go")
    # @send_list=Order.where(:courier_id=>@user.id)

  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    @user.update( user_params )
    if @user.save
      redirect_to user_path
    else
      render 'new'
    end
  end
  protected

  def user_params
    params.require(:user).permit(:fullname, :email, :phone, :introduction )
  end
end
