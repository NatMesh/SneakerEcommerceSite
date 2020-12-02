class UpdateTaxTypeAndAddHst < ActiveRecord::Migration[6.0]
  def change
    change_column :provinces, :provincial_sales_tax, :integer
    change_column :provinces, :goods_and_services_tax, :integer
    add_column :provinces, :harmonized_sales_tax, :integer
  end
end
