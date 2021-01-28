class Yogaclass < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_one_attached :photo
  # Do not forget to add ":photo" in the params when working on the controller!

  CLASS_TYPES = ['Yoga-Beginner', 'Yoga-Intermediate', 'Yoga-Advanced', 'Pilates-Beginner', 'Pilates-Intermediate', 'Pilates-Advanced']
  validates :title, presence: true
  validates :price, presence: true
  validates :class_type, inclusion: { in: CLASS_TYPES, allow_nil: false }
  validates :address, presence: true
  validates :duration, presence: true
end
