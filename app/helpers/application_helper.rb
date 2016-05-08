module ApplicationHelper
  def user_photo(user)
    if user.user_photo?
      image_url = user.user_photo.url(:thumb)
    elsif user.fb_pic?
      image_url = user.fb_pic
    else
      image_url = "default_head.png"
    end
    image_tag image_url
  end
end
