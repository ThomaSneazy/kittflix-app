class Vehicle < ApplicationRecord
  before_save :images_limit_min
  has_many_attached :photos
  has_many :reviews, dependent: :destroy
  belongs_to :user
  has_many :bookings
  validates :name, uniqueness: true, presence: true
  validates :photos, attached: true, limit: { min: 3, max: 5 }

  private

  def images_limit_min
    return if photos.empty?

    errors[:base] << "You must to upload 3 images minimum" if photos.length < 3
    errors[:base] << "You must to upload 5 images max" if photos.length > 5
  end
end
