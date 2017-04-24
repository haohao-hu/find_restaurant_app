class Review < ActiveRecord::Base
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  belongs_to :restaurant
  validates :user_id, presence: true
  validates :restaurant_id, presence: true
  validates :text, presence: true
  validates :stars, presence: true
end
