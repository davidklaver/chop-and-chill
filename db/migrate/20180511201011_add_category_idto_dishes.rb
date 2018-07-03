class AddCategoryIdtoDishes < ActiveRecord::Migration[5.0]
  def change
  	 add_column :dishes, :category_id, :integer
  end
end
