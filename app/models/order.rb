class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_items
  has_many :sneakers, through: :order_items

  validates :total_price, :shipping_address, :order_address, :order_email, :order_status,
            :stripe_order_id, presence: true
  validates :total_price, numericality: true
end
