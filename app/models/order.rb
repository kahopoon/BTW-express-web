class Order < ActiveRecord::Base
  has_one :detail, :dependent => :destroy
  belongs_to :user
  accepts_nested_attributes_for :detail

  has_attached_file :photo, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  do_not_validate_attachment_file_type :photo, content_type: /\Aimage\/.*\Z/
  def self.listorder(idx,role,st)
  	if role=="owner"
    	Order.where(:owner_id=>idx,:status=>st)
	else
    	Order.where(:courier_id=>idx,:status=>st) unless st=="posted"	
	end
  end

end
