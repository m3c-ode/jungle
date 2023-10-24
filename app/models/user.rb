class User < ApplicationRecord
  has_secure_password

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 4 }
  validates :password_confirmation, presence: true

  def self.authenticate_with_credentials(email, password)
    return unless !email.nil? && !password.nil?

    user = User.find_by_email(email.strip.downcase)
    return unless user && user.authenticate(password)

    user
  end
end
