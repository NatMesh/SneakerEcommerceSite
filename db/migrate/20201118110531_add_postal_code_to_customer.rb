class AddPostalCodeToCustomer < ActiveRecord::Migration[6.0]
  def change
    add_column :customers, :postal_code, :string
  end
end
