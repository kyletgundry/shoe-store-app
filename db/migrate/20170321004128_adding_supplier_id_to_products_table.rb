class AddingSupplierIdToProductsTable < ActiveRecord::Migration[5.0]
  def change
    add_column :shoes, :supplier_id, :integer
  end
end
