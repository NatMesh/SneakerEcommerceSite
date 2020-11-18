class Brand < ApplicationRecord
  validates :name, uniqueness: true
end
