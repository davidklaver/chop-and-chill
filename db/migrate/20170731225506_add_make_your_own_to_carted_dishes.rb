class AddMakeYourOwnToCartedDishes < ActiveRecord::Migration[5.0]
  def change
    add_column :carted_dishes, :make_your_own, :string
  end
end
