class AddDressingToDishes < ActiveRecord::Migration[5.0]
  def change
    add_column :dishes, :dressing, :string
  end
end
