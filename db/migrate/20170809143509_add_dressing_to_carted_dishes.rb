class AddDressingToCartedDishes < ActiveRecord::Migration[5.0]
  def change
    add_column :carted_dishes, :dressing, :string
  end
end
