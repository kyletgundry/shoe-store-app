class UpdatePriceToInteger < ActiveRecord::Migration[5.0]
  def change
    change_column :shoes, :price, "numeric USING CAST(price AS numeric)"
    change_column :shoes, :price, :decimal, precision: 9, scale: 2
  end
end
