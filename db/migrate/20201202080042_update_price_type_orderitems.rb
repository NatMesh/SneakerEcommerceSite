class UpdatePriceTypeOrderitems < ActiveRecord::Migration[6.0]
  def change
    change_column :order_items, :price, :integer
  end
end
