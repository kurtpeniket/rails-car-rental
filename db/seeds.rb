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

# url = 'https://private-6f7b7b-carsapi1.apiary-mock.com/cars'
# uri = URI(url)
# response = Net::HTTP.get(uri)
# json = JSON.parse(response)

puts 'Cleaning DB...'
Booking.destroy_all
Car.destroy_all
User.destroy_all

car_details = [
  ['Mclaren', '720S', 'https://cdn.motor1.com/images/mgl/kJo0M/s3/2019-mclaren-720s-coupe.jpg', '88 Church Road, London, UK'],
  ['Ferrari', 'SF90 Stradale', 'https://media.autoexpress.co.uk/image/private/s--xLU6xl8a--/v1594991800/autoexpress/2020/07/Ferrari%20SF90-8.jpg','471 Station Road, London, UK'],
  ['Lamborghini', 'Aventador SVJ', 'https://icdn2.digitaltrends.com/image/digitaltrends/lamborghini_aventador_svj_roadster_1.jpg', '387 Queens Road, London, UK'],
  ['Aston Martin', 'Vanquish', 'https://img.youtube.com/vi/kwjtol__F6I/maxresdefault.jpg', '91 High Street, London, UK'],
  ['Porsche', 'Carrera GT', 'https://content.assets.pressassociation.io/2019/08/23163422/df248f18-7cd6-4e58-9736-4aaa3d52e558.jpg', '9498 Park Avenue, London, UK'],
  ['Ford', 'GT', 'https://media.architecturaldigest.com/photos/59235b3a5048d15bd5b220ba/master/pass/2017-Ford-GT-front-three-quarters.jpeg', '55 Alexander Road, London, UK']
]

puts 'Seeding new DB...'

index = 0

6.times do

  user = User.new(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: '123456'
  )
  user.save!

  car = Car.new(
    user: user,
    brand: car_details[index][0],
    model: car_details[index][1],
    price_per_day: rand(1..1000),
    img: car_details[index][2],
    address: car_details[index][3]
  )
  car.save!

  index += 1
end
