class Order < ActiveRecord::Base
  has_one :detail
  belongs_to :user


  has_attached_file :photo, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  do_not_validate_attachment_file_type :photo, content_type: /\Aimage\/.*\Z/
end
