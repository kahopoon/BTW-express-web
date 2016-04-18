namespace :dev do

  task :fake => :environment do
    User.delete_all
    Order.delete_all
    Detail.delete_all

    puts "Creating fake Data!"

    user = User.create!( :email => "1@hotmail.com", :password => "11111111")

    50.times do |i|
      p = Order.create( :owner_id => user ) # :user_id => user.id
      # p.detail.create( :fee => (rand(99) + 1) * 10)
      # Detail.create( :fee => (rand(99) + 1) * 10,:order => p)
      detail = p.build_detail( :fee => (rand(99) + 1) * 10, :photo => "https://img.buzzfeed.com/buzzfeed-static/static/2015-03/28/19/enhanced/webdr07/anigif_enhanced-buzz-14210-1427585395-12.gif")
      detail.save

      pickup = detail.build_pickup( :address => Faker::Address.street_address )
      pickup.save

      delivery = detail.build_delivery( :address => Faker::Address.street_address )
      delivery.save

      puts "Create Order #{p.id}"
    end
  end

end
