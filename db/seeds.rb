# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

puts 'Cleaning DB...'
Car.destroy_all
User.destroy_all

puts 'Seeding new DB...'
100.times do
  user = User.new(
    name: Faker::GreekPhilosophers.name,
    email: Faker::Internet.email,
    password: '123456'
  )
  user.save!
  puts "Created user: #{user.id}"

  car = Car.new(
    user_id: User.all.sample.id,
    brand: Faker::Ancient.hero,
    model: Faker::FunnyName.name,
    price_per_day: rand(1..100)
  )
  car.save!
  puts "Created car: #{car.id}"
end