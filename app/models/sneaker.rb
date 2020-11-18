class Sneaker < ApplicationRecord
  belongs_to :brand
  belongs_to :category
  belongs_to :designer
  validates :main_colour, :colour_way, :gender, :grid_picture, :main_picture, :midsole, :name, :nickname, :release_date, :price_cents, :shoe_story, :upper_material, presence: true
  validates :price_cents, numericality: { integer: true }
end
