class Review < ApplicationRecord
  belongs_to :yogaclass
  validates :content, presence: true, length: { minimum: 5 }
end
