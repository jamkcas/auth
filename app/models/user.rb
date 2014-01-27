class User < ActiveRecord::Base
  has_secure_password # calls on bcrypt to encrypt password
  attr_accessible :name, :email, :password, :password_confirmation # dont make password_digest accessible

  before_save :create_remember_token # before something is saved into a database, this function is run

  validates :name, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: {minimum: 6}
  validates :password_confirmation, presence: true # makes sure the password is confirmed (bcrypt makes sure it is the same as password)

  def create_remember_token
    self.remember_token = SecureRandom.urlsafe_base64
  end

end
