class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.references :customer, null: false, foreign_key: true
      t.float :total_price
      t.string :shipping_address
      t.string :order_address
      t.string :order_email
      t.date :order_date
      t.string :order_status
      t.integer :stripe_order_id

      t.timestamps
    end
  end
end
