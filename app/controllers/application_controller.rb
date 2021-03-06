class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def after_sign_in_path_for(resource)
    if current_user.introduction.nil? # 之後換成簡介
      edit_user_path(current_user) # 之後把要填資料的path放這
    else
      request.env['omniauth.origin'] || stored_location_for(resource) || root_path
    end
  end
end
