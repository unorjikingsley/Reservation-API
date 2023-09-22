require 'rails_helper'
RSpec.describe Car, type: :model do
    let(:user) { User.create(username: 'sam', email: 'sam@gmail.com', password: 'password') }
    subject do
      Car.new(user_id: user.id, name: 'Honda',
              image: 'https://images.unsplash.com/photo-1542228262-3d663b306a53?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2071&q=80',
              description: 'Good car', model: '2023', price: 23_000.0)
    end

    context 'Testing validations' do
      it 'Car should be invalid with name set to nil' do
        subject.name = nil
        expect(subject).to_not be_valid
      end

      it 'Car should be invalid with image set to nil' do
        subject.image = nil
        expect(subject).to_not be_valid
      end

      it 'Car should be invalid with description set to nil' do
        subject.description = nil
        expect(subject).to_not be_valid
      end

      it 'Car should be invalid with price set to nil' do
        subject.price = nil
        expect(subject).to_not be_valid
      end

      it 'Car should be valid with presence of all valid attributes' do
        expect(subject).to be_valid
      end
    end
end
