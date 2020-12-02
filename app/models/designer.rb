class Designer < ApplicationRecord
  has_many :sneakers
  validates :name, uniqueness: true
  paginates_per 20
end
