class AddPriceToCartedDishes < ActiveRecord::Migration[5.0]
  def change
  	add_column :carted_dishes, :price, :decimal, precision: 7, scale: 2
  end
end
