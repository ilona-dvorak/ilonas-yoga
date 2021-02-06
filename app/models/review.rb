class Review < ApplicationRecord
  belongs_to :yogaclass
  validates :content, length: { minimum: 5 }
end
