class SizeRange < ApplicationRecord
  validates :size_number, presence: true
  validates :name, uniqueness: true
  validates :size_number, numericality: true
end
