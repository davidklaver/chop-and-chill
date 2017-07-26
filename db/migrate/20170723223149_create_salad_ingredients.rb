class CreateSaladIngredients < ActiveRecord::Migration[5.0]
  def change
    create_table :salad_ingredients do |t|
      t.string :name
      t.string :image

      t.timestamps
    end
  end
end
