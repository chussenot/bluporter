def time_rand from = Time.now, to = Time.now + 300.years
  Time.at(from + rand * (to.to_f - from.to_f))
end

def new_destination
  {
    lat: Faker::Geolocation.lat.to_s,
    long: Faker::Geolocation.lng.to_s,
    name: Faker::Address.city
  }
end

Travel.delete_all
(1..1000).to_a.each do |i|
  Travel.create(
    from: new_destination(),
    to: new_destination(),
    departure_date: time_rand(),
    price: Random.rand(200-10) + 100,
    description: Faker::Lorem.sentence(10)
    )
end
