class UpdateTaxTypeAndAddHstOrders < ActiveRecord::Migration[6.0]
  def change
    change_column :orders, :total_price, :integer
    change_column :orders, :provincial_sales_tax, :integer
    change_column :orders, :goods_and_services_tax, :integer
    add_column :orders, :harmonized_sales_tax, :integer
  end
end
