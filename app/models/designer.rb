class Designer < ApplicationRecord
  validates :name, uniqueness: true
end
