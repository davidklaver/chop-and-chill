class AddMethodToOrders < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :method, :string
  end
end
