class ChangeColumnName < ActiveRecord::Migration[5.0]
  def change
  	rename_column :orders, :method, :order_method
  end
end
