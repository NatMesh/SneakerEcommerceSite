class Sneaker < ApplicationRecord
  belongs_to :brand
  belongs_to :category
  belongs_to :designer
  has_many :order_items
  has_many :orders, through: :order_items
  has_many :sneaker_sizes
  has_many :size_ranges, through: :sneaker_sizes

  validates :main_colour, :colour_way, :gender, :grid_picture, :main_picture, :midsole, :name,
            :nickname, :release_date, :price_cents, :shoe_story, :upper_material, presence: true
  validates :price_cents, numericality: { integer: true }

  paginates_per 20
end
