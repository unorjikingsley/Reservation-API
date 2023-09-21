# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

user_1 = User.create(username: "Bif", email: "bif@example.com", password: "password")
user_2 = User.create(username: "Den", email: "den@example.com", password: "password")
user_3 = User.create(username: "King", email: "king@example.com", password: "password")
user_4 = User.create(username: "Emma", email: "emma@example.com", password: "password")
user_5 = User.create(username: "Sal", email: "sal@example.com", password: "password")


User.all.each do |user|
    5.times do
      user.cars.create(
        name: Faker::Vehicle.make_and_model,
        image: 'https://images.unsplash.com/photo-1542228262-3d663b306a53?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2071&q=80',     
        description: Faker::Lorem.sentence,
        price: Faker::Number.decimal(),
        model: Faker::Vehicle.model
      )
    end
  end
  

  User.all.each do |user|
    4.times do
      car = Car.all.sample
      user.reservations.create(
        start_date: Faker::Date.between(from: 1.month.from_now, to: 2.months.from_now),
        end_date: Faker::Date.between(from: Date.today, to: 1.month.from_now),
        city: Faker::Address.city,
        car: car
      )
    end
  end
