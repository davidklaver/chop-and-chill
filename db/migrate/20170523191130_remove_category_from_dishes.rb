class RemoveCategoryFromDishes < ActiveRecord::Migration[5.0]
  def change
    remove_column :dishes, :category, :string
  end
end
