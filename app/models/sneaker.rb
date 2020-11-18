class Sneaker < ApplicationRecord
  belongs_to :brand
  belongs_to :category
  belongs_to :designer
  has_many :order_items
  has_many :orders, through: :order_items

  validates :main_colour, :colour_way, :gender, :grid_picture, :main_picture, :midsole, :name, :nickname, :release_date, :price_cents, :shoe_story, :upper_material, presence: true
  validates :price_cents, numericality: { integer: true }
end
