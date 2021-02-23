# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
require 'json'
require 'net/http'

url = 'https://private-6f7b7b-carsapi1.apiary-mock.com/cars'
uri = URI(url)
response = Net::HTTP.get(uri)
json = JSON.parse(response)

puts 'Cleaning DB...'
Car.destroy_all
User.destroy_all

puts 'Seeding new DB...'
100.times do
  user = User.new(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: '123456'
  )
  user.save!

  randomIndex = rand(1..100)
  car = Car.new(
    user_id: User.all.sample.id,
    brand: json[randomIndex]["make"],
    model: json[randomIndex]["model"],
    price_per_day: randomIndex,
    img: json[randomIndex]["img_url"]
  )
  car.save!
end
