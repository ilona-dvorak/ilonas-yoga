class Yogaclass < ApplicationRecord
  belongs_to :user
  has_one_attached :photo
  has_many :bookings

  CLASS_TYPES = ['Yoga-Beginner', 'Yoga-Intermediate', 'Yoga-Advanced', 'Pilates-Beginner', 'Pilates-Intermediate', 'Pilates-Advanced']
  validates :title, presence: true
  validates :price, presence: true
  validates :class_type, inclusion: { in: CLASS_TYPES, allow_nil: false }
  validates :address, presence: true
  validates :duration, presence: true
end
