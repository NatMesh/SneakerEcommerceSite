class Province < ApplicationRecord
  has_many :customers
  validates :name, presence: true, uniqueness: true
  validates :provincial_sales_tax, numericality: true
  validates :goods_and_services_tax, numericality: true
end
