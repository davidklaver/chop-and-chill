class RemoveSubcategoryFromDishes < ActiveRecord::Migration[5.0]
  def change
    remove_column :dishes, :subcategory, :string
  end
end
