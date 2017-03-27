class CreateCategoryShoes < ActiveRecord::Migration[5.0]
  def change
    create_table :category_shoes do |t|
      t.integer :shoe_id
      t.integer :category_id

      t.timestamps
    end
  end
end
