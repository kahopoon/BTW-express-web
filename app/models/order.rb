class Order < ActiveRecord::Base
  has_one :detail
  belongs_to :user
end
