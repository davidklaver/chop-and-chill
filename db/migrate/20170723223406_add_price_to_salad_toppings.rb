class AddPriceToSaladToppings < ActiveRecord::Migration[5.0]
  def change
    add_column :salad_toppings, :price, :decimal, precision: 7, scale: 2
  end
end
