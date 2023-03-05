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

