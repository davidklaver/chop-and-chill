class CreateDeliveryAreas < ActiveRecord::Migration[5.0]
  def change
    create_table :delivery_areas do |t|
      t.string :name
      t.decimal :price, precision: 5, scale: 2

      t.timestamps
    end
  end
end
