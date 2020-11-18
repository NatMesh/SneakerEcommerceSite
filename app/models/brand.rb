class Brand < ApplicationRecord
  has_many :sneakers
  validates :name, uniqueness: true
end
