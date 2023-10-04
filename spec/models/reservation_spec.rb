require 'rails_helper'

RSpec.describe Reservation, type: :model do
  let(:user) { User.create(username: 'sam', email: 'sam@gmail.com', password: 'password') }
  
  let(:car) do
    Car.create(user_id: user.id,
               name: 'Honda',
               image: 'https://images.unsplash.com/photo-1542228262-3d663b306a53?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2071&q=80',
               description: 'Good car',
               model: '2023',
               price: 23_000.0)
  end

  subject do
    Reservation.new(car_id: car.id, user_id: user.id, start_date: '1/2/2023', end_date: '5/6/2023', city: 'Lagos')
  end

  context 'Testing validations' do
    it 'Reservation should be invalid with city set to nil' do
      subject.city = nil
      expect(subject).to_not be_valid
    end

    it 'Reservation should be invalid with start_date set to nil' do
      subject.start_date = nil
      expect(subject).to_not be_valid
    end

    it 'Reservation should be invalid with end_date set to nil' do
      subject.end_date = nil
      expect(subject).to_not be_valid
    end

    it 'Reservation should be valid with presence of valid attributes' do
      expect(subject).to be_valid
    end
  end
end
