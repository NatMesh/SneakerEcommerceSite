class Brand < ApplicationRecord
  has_many :sneakers
  validates :name, uniqueness: true
  has_one_attached :image
  paginates_per 20
end
