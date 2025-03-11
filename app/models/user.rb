class User < ApplicationRecord
  has_secure_password
  has_one_attached :image
  has_many :user_events
  has_many :events, through: :user_events

  validates :email, presence: true, uniqueness: true
  validates :name, presence: true
end


