class CreateDishes < ActiveRecord::Migration[5.0]
  def change
    create_table :dishes do |t|
      t.string :name
      t.text :description
      t.decimal :price, precision: 7, scale: 2

      t.timestamps
    end
  end
end
