class UserprofileController < ApplicationController

	def show
		if current_user
			@user=current_user
		else
			@user=User.first
		end
		@role=params[:role]
		#owner -> show tooken with new / old
		@post_order=Order.listorder(@user.id,params[:role],"posted")
		@old_order=Order.listorder(@user.id,params[:role],"done")
		@go_order=Order.listorder(@user.id,params[:role],"go")				
			# @own_list=Order.where(:owner_id=>@user.id)

			# @send_list=Order.where(:courier_id=>@user.id)

	end

end
