class AddDressingPlacementToCartedDishes < ActiveRecord::Migration[5.0]
  def change
    add_column :carted_dishes, :dressing_placement, :string
  end
end
