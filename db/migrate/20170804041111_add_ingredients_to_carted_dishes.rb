class AddIngredientsToCartedDishes < ActiveRecord::Migration[5.0]
  def change
    add_column :carted_dishes, :salad_ingredients, :string
  end
end
