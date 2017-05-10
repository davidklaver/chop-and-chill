class AddSubcategoryToDishes < ActiveRecord::Migration[5.0]
  def change
    add_column :dishes, :subcategory, :string
  end
end
