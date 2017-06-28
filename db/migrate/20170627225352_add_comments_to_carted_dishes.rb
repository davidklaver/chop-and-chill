class AddCommentsToCartedDishes < ActiveRecord::Migration[5.0]
  def change
    add_column :carted_dishes, :comments, :text
  end
end
