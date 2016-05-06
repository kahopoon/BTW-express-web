namespace :dev do

  task :delete_order => :environment do
    Order.delete_all
    Detail.delete_all
  end

  task :fake => :environment do
    User.delete_all
    Order.delete_all
    Detail.delete_all

    puts "Creating fake Data!"
    User.create!(:email => "afu@gmail.com", :password => "11111111",
      :phone => Faker::PhoneNumber.phone_number, :fullname=>"lala")
    10.times do |i|
      user = User.create!( :email => Faker::Internet.free_email, :password => "11111111",
                           :phone => Faker::PhoneNumber.phone_number, :fullname=>Faker::StarWars.character
                          )
    end
    user_idarr=User.all.map{|u|u.id}
    img_url="https://img.buzzfeed.com/buzzfeed-static/static/2015-03/28/19/enhanced/webdr07/anigif_enhanced-buzz-14210-1427585395-12.gif"
    img_2="http://pic.pimg.tw/kalaok/1411718869-1924547221.gif"
    status=["posted","go","done"]
    50.times do |i|
      user=user_idarr.sample(2)
      p = Order.create( :owner_id => user[0], :status => status.sample(1)[0], :pickup_time => Time.now,
                        :deliver_time => Faker::Time.forward(5),
                        :pickup_addr => "台北市大安區忠孝東路四段1號", :pickup_latlng => "25.041707, 121.544119",
                        :deliver_addr => "台北市松山區敦化北路340-9號", :deliver_latlng => "25.063503, 121.552114",
                        :category => Faker::StarWars.specie,
                        #:photo => img_2,
                      )
      puts p.status
      if p.status!="posted"
        p.courier_id = user[1]
      end
      if p.status=="done"
        p.rate_owner= (rand(5) + 1)
        p.rate_courier= (rand(5) + 1)
      end
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
