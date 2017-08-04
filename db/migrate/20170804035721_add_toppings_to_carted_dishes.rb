class AddToppingsToCartedDishes < ActiveRecord::Migration[5.0]
  def change
    add_column :carted_dishes, :toppings, :string
  end
end
