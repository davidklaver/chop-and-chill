class AddSubcategoryIdToDishes < ActiveRecord::Migration[5.0]
  def change
  	add_column :dishes, :subcategory_id, :integer
  end
end
