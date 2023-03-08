user = User.create! :email => 'john@gmail.com', :password => 'topsecret', :password_confirmation => 'topsecret'

20.times do |task|
  Building.create!(
    {
      name: Faker::Lorem.sentence,
      address: Faker::Address.street_address,
      lat: Faker::Address.latitude,
      long: Faker::Address.longitude,
      user_id: user.id
    }
  )
end

Building.all.each do |building|
  building.cover_image.attach(io: File.open("app/assets/images/building_#{rand(13)}.jpeg"), filename: "#{SecureRandom.hex(5)}.jpeg")

  building.cover_image.variant(:thumb).processed
end

