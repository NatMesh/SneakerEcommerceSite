class SizeRange < ApplicationRecord
  validates :size_number, presence: true
  validates :size_number, uniqueness: true
  validates :size_number, numericality: true
  has_many :sneaker_sizes
  has_many :sneakers, through: :sneaker_sizes
end
