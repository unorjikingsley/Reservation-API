class User < ApplicationRecord
  # has_many :reservations, foreign_key: 'user_id', dependent: :destroy
  # has_many :cars, foreign_key: 'user_id', dependent: :destroy

  # validates :username, :email, :password, presence: true
end
