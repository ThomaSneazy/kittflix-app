class Vehicle < ApplicationRecord
  has_many_attached :photos
  has_many :reviews, dependent: :destroy
  belongs_to :user
  has_many :bookings
  validates :name, uniqueness: true, presence: true
end
