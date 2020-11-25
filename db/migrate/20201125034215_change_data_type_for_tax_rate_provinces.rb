class ChangeDataTypeForTaxRateProvinces < ActiveRecord::Migration[6.0]
  def change
    change_column :provinces, :provincial_sales_tax, :decimal
    change_column :provinces, :goods_and_services_tax, :decimal
  end
end
