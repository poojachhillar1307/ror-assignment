class Event < ApplicationRecord
  has_many :user_events
  has_many :users, through: :user_events

  has_and_belongs_to_many :categories

  has_one_attached :image

  validates :title, presence: true
  validates :description, presence: true
end
