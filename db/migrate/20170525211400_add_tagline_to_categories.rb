class AddTaglineToCategories < ActiveRecord::Migration[5.0]
  def change
    add_column :categories, :tagline, :string
  end
end
