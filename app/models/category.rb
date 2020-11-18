class Category < ApplicationRecord
  validate :name, uniqueness: true
end
