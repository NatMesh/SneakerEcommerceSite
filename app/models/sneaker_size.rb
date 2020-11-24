class SneakerSize < ApplicationRecord
  belongs_to :sneaker
  belongs_to :size_range
end
