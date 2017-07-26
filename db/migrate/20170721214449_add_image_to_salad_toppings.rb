class AddImageToSaladToppings < ActiveRecord::Migration[5.0]
  def change
  	add_column :salad_toppings, :image, :string
  end
end
