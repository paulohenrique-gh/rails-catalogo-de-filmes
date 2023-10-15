class Movie < ApplicationRecord
  enum status: { released: 0, not_released: 1 }

  belongs_to :director
  belongs_to :genre

  has_one_attached :poster
end
