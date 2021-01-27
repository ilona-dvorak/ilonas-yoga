class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :yogaclasses
  has_many :bookings
  has_one_attached :photo
  # Do not forget to add ":photo" in the params when working on the controller!

  USER_TYPES = ['Student', 'Teacher']
  validates :user_type, presence: true, inclusion: { in: USER_TYPES, allow_nil: false }
end
