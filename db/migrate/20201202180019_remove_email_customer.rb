class RemoveEmailCustomer < ActiveRecord::Migration[6.0]
  def change
    remove_column :customers, :email
  end
end
