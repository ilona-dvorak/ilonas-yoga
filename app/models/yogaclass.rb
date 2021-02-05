class Yogaclass < ApplicationRecord
  belongs_to :user
  has_one_attached :photo
  has_many :bookings
  has_many :reviews, dependent: :destroy

include PgSearch::Model
  pg_search_scope :global_search,
    against: [:title, :address],
    associated_against: {
    user: [:first_name, :last_name]
    },
   using: {
      tsearch: { prefix: true }
   }

  CLASS_TYPES = ['Yoga-Beginner', 'Yoga-Intermediate', 'Yoga-Advanced', 'Pilates-Beginner', 'Pilates-Intermediate', 'Pilates-Advanced']
  validates :title, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :class_type, inclusion: { in: CLASS_TYPES, allow_nil: false }
  validates :address, presence: true
  validates :duration, presence: true
end
