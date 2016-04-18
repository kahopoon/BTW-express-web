class Detail < ActiveRecord::Base
  has_one :pickup
  has_one :delivery
  belongs_to :order
end
