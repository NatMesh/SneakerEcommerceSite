class CreateProvinces < ActiveRecord::Migration[6.0]
  def change
    create_table :provinces do |t|
      t.string :name
      t.float :provincial_sales_tax
      t.float :goods_and_services_tax

      t.timestamps
    end
  end
end
