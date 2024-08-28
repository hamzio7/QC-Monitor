class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, authentication_keys: [:username]

  validates :username, presence: true, uniqueness: true

  # Manually validate passwords
  validates :password, presence: true, length: { minimum: 4 }, if: -> { new_record? || !password.nil? }
end
