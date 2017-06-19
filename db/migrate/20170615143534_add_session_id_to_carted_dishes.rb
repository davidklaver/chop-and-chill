class AddSessionIdToCartedDishes < ActiveRecord::Migration[5.0]
  def change
    add_column :carted_dishes, :session_id, :string
  end
end
