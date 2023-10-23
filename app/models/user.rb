class User < ApplicationRecord
  has_secure_password

  validates :first_name
  validates :last_name
  validates :email
  validates :password
  validates :password_confirmation

end
