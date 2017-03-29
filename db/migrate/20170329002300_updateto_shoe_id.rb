class UpdatetoShoeId < ActiveRecord::Migration[5.0]
  def change
    rename_column :carted_products, :product_id, :shoe_id
    rename_table :carted_products, :carted_shoes
  end
end
