namespace :dev do

  task :fake => :environment do
    User.delete_all
    Order.delete_all
    Detail.delete_all

    puts "Creating fake Data!"

    user = User.create!( :email => "1@hotmail.com", :password => "11111111")
    img_url="https://img.buzzfeed.com/buzzfeed-static/static/2015-03/28/19/enhanced/webdr07/anigif_enhanced-buzz-14210-1427585395-12.gif"
    10.times do |i|
      p = Order.create( :owner_id => user.id, :status => "posted", :pickup_time => Time.now, :deliver_time => Faker::Time.forward(5),
                        :pickup_addr => "台北市大安區忠孝東路四段1號", :pickup_latlng => "25.041707, 121.544119",
                        :deliver_addr => "台北市松山區敦化北路340-9號", :deliver_latlng => "25.063503, 121.552114",
                        :fake_user_name => Faker::StarWars.character, :fake_phone => Faker::PhoneNumber.phone_number,
                        :category => Faker::StarWars.specie)

      # Detail.create( :fee => (rand(99) + 1) * 10,:order => p)
      p.build_detail( :addressees_name => Faker::Name.name, :addressees_mobile=>Faker::PhoneNumber.cell_phone )
      p.detail.fee = (rand(99) + 1) * 10
      p.detail.prepay = (rand(99) + 1) * 10
      p.detail.description=Faker::Lorem.paragraph
      p.save

      puts "Create Order #{p.id}"
    end
  end

end
