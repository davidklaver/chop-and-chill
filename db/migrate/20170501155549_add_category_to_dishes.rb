class AddCategoryToDishes < ActiveRecord::Migration[5.0]
  def change
  	 add_column :dishes, :category, :string
  end
end
