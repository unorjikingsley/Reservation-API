user_1 = User.create(
    provider: 'email',
    uid: "bif@example.com",
    allow_password_change: false,
    username: "Bif",
    nickname: nil,
    image: nil,
    email: "bif@example.com"
  )
  
  user_2 = User.create(
    provider: 'email',
    uid: "den@example.com",
    allow_password_change: false,
    username: "Den",
    nickname: nil,
    image: nil,
    email: "den@example.com"
  )
  
  user_3 = User.create(
    provider: 'email',
    uid: "king@example.com",
    allow_password_change: false,
    username: "King",
    nickname: nil,
    image: nil,
    email: "king@example.com"
  )
  
  user_4 = User.create(
    provider: 'email',
    uid: "emma@example.com",
    allow_password_change: false,
    username: "Emma",
    nickname: nil,
    image: nil,
    email: "emma@example.com"
  )
  
  user_5 = User.create(
    provider: 'email',
    uid: "sal@example.com",
    allow_password_change: false,
    username: "Sal",
    nickname: nil,
    image: nil,
    email: "sal@example.com"
  )

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