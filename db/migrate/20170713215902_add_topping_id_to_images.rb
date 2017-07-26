class AddToppingIdToImages < ActiveRecord::Migration[5.0]
  def change
  	add_column :images, :topping_id, :integer
  end
end
