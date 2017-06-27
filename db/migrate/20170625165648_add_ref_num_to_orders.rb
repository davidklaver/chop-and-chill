class AddRefNumToOrders < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :ref_num, :string
  end
end
