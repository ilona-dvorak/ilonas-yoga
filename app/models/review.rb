class Review < ApplicationRecord
  belongs_to :yogaclass
  validates :content, length: { minimum: 20 }
end
