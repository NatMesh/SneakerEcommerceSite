class CreateCustomers < ActiveRecord::Migration[6.0]
  def change
    create_table :customers do |t|
      t.string :full_name
      t.string :email
      t.string :password
      t.string :billing_address
      t.string :shipping_address
      t.string :city
      t.references :province, null: false, foreign_key: true
      t.string :country
      t.string :phone_number

      t.timestamps
    end
  end
end
