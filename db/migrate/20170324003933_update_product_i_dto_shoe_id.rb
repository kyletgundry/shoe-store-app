class UpdateProductIDtoShoeId < ActiveRecord::Migration[5.0]
  def change
    rename_column :orders, :product_id, :shoe_id
  end
end
