class AddSaladMixToCartedDishes < ActiveRecord::Migration[5.0]
  def change
    add_column :carted_dishes, :salad_mix, :string
  end
end
