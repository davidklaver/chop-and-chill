class CreateSaladToppings < ActiveRecord::Migration[5.0]
  def change
    create_table :salad_toppings do |t|
      t.string :name

      t.timestamps
    end
  end
end
