class RemoveBillingAddrRemoveShippingAddrRemoveAddRegularAddress < ActiveRecord::Migration[6.0]
  def change
    remove_column :customers, :billing_address
    remove_column :customers, :shipping_address
    add_column :customers, :address, :string
  end
end
