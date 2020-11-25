class ChangePriceTypeInOrderItems < ActiveRecord::Migration[6.0]
  def change
    change_column :order_items, :price, :decimal
  end
end
