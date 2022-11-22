class User < ApplicationRecord
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false}
  validates :password, length: { minimum: 6 }
  has_secure_password

  def self.authenticate_with_credentials(email, password)
    stripped_email = email.strip.downcase
    user = self.where("LOWER(email) = ?", stripped_email).first
    return nil unless user && user.authenticate(password)
    user
  end


end
