class UserprofileController < ApplicationController

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

end
