class Order < ActiveRecord::Base
  has_one :detail
end
