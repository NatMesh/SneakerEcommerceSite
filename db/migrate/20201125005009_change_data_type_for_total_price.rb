class ChangeDataTypeForTotalPrice < ActiveRecord::Migration[6.0]
  def change
    change_column :orders, :total_price, :decimal
  end
end
