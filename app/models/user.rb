class User < ApplicationRecord
  has_secure_password
  has_many :avocados
  validates :email, uniqueness: true
end
