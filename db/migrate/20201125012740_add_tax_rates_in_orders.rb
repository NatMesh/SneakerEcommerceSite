class AddTaxRatesInOrders < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :provincial_sales_tax, :decimal
    add_column :orders, :goods_and_services_tax, :decimal
  end
end
