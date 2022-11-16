puts "Cleaning database..."
Restaurant.destroy_all

puts "Creating restaurants..."
10.times do
  r = Restaurant.new(name: Faker::Restaurant.name, address: Faker::Address.street_address, phone_number: Faker::PhoneNumber.phone_number_with_country_code, category: ["chinese", "italian", "japanese", "french", "belgian"].sample)
  r.save
  3.times do
    rat = Review.new(content: Faker::Restaurant.review, rating: [0, 1, 2, 3, 4, 5].sample, restaurant: r)
    rat.save
  end
end
puts "Finished!"
