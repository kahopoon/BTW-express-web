json.meta do
  json.current_page @orders.current_page
  json.total_pages @orders.total_pages
  json.per_page @orders.limit_value
  json.next_url (@orders.last_page?)? nil : v1_orders_url( :page => @orders.next_page )
  json.previous_url (@orders.first_page?)? nil : v1_orders_url( :page => @orders.prev_page )
end

json.results do
  json.array!(@orders) do |order|
    json.partial! 'order', order: order
  end
end
