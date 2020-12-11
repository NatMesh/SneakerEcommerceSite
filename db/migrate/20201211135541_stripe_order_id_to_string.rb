class StripeOrderIdToString < ActiveRecord::Migration[6.0]
  def change
    change_column :orders, :stripe_order_id, :string
  end
end
