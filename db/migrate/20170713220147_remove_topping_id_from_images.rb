class RemoveToppingIdFromImages < ActiveRecord::Migration[5.0]
  def change
    remove_column :images, :topping_id, :integer
  end
end
