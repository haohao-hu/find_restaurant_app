class Restaurant < ActiveRecord::Base
	has_many :reviews, dependent: :destroy
	 before_save :create_remember_token
validates :name, presence: true, length: { maximum: 50 }
validates :address, presence: true
validates :postal_code, presence: true
validates :latitude, presence: true
validates_numericality_of :latitude, :longitude, :on => :create
validates :longitude, presence: true
validates :password, presence: true, length: { minimum: 6 }, on: :create
validates :password_confirmation, presence: true, on: :create
has_secure_password

  def create_remember_token
	self.remember_token = SecureRandom.urlsafe_base64
  end

  def feed
  	Review.where("restaurant_id = ?", id)
  end
end
