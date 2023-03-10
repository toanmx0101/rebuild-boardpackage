User.destroy_all
Building.destroy_all
Policy.destroy_all
BuildingPolicy.destroy_all

user = User.create :email => 'john@gmail.com', :password => 'topsecret', :password_confirmation => 'topsecret'

20.times do |task|
  Building.create!(
    {
      name: Faker::Lorem.sentence,
      address: Faker::Address.street_address,
      lat: Faker::Address.latitude,
      long: Faker::Address.longitude,
      user_id: user.id,
      residential_type: rand(4),
      description: Faker::Lorem.paragraph_by_chars
    }
  )
end

Building.all.each do |building|
  building.cover_image.attach(io: File.open("app/assets/images/building_#{rand(13)}.jpeg"), filename: "#{SecureRandom.hex(5)}.jpeg")

  building.cover_image.variant(:thumb).processed
end

policies = [
    {
        title: "Zoning Regulations",
        description: "These policies outline the allowable land use and density for specific areas of a city or town",
    },
    {
        title: "Building Codes",
        description: "Building codes are regulations that set the minimum standards for construction, plumbing, electrical, and mechanical systems for new and existing buildings",
    },
    {
        title: "Energy Efficiency Standards",
        description: "These policies require buildings",
    },
    {
        title: "Historic Preservation",
        description: "Historic preservation policies protect buildings",
    },
    {
        title: "Accessibility Requirements",
        description: "Accessibility policies require buildings to be designed",
    },
    {
        title: "Fire Safety Standards",
        description: "Fire safety policies require buildings to have adequate fire suppression systems",
    },
    {
        title: "Stormwater Management",
        description: "These policies require buildings to manage stormwater runoff",
    },
    {
        title: "Parking Requirements",
        description: "Parking policies require buildings to provide a certain amount of parking spaces",
    },
    {
        title: "Affordable Housing",
        description: "Affordable housing policies require developers",
    },
    {
        title: "Sustainable Design Standards",
        description: "Sustainable design policies require buildings to be designed and constructed",
    }
]

policies.each do |policy|
  Policy.create(policy)
end

Building.all.each do |building|
  Policy.all.sample(6).each do |policy|
    building.building_policies.create(
      policy: policy,
      policy_type: rand(3)
    )
  end

  rand(2..6).times do |index|
    ["A", "B", "C", "D", "E"].each do |unit|
      apartment = building.apartments.create(
        unit: "#{index}#{unit}",
        price: rand(10..30) * 100,
        status: rand(4)
      )

      apartment.image.attach(
        io: File.open("app/assets/images/apartment_#{rand(5)}.png"), filename: "#{SecureRandom.hex(5)}.jpeg"
      )
    end
  end
end
