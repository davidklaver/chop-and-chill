class AddDishIdToImages < ActiveRecord::Migration[5.0]
  def change
    add_column :images, :dish_id, :integer
  end
end
