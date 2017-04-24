class User < ActiveRecord::Base
	has_many :reviews, dependent: :destroy
	before_save { self.email = email.downcase }
	before_save :create_remember_token
 validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
 validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
 uniqueness: { case_sensitive: false }
 validates :password, presence: true, length: { minimum: 6 }, on: :create
 validates :password_confirmation, presence: true, on: :create
 has_secure_password

 def create_remember_token
   self.remember_token = SecureRandom.urlsafe_base64
 end

 def feed
 	Review.where("user_id = ?", id)
 end
end
