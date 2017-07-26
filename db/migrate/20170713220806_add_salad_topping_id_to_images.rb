class AddSaladToppingIdToImages < ActiveRecord::Migration[5.0]
  def change
  	add_column :images, :salad_topping_id, :integer
  end
end
