class CreateShoes < ActiveRecord::Migration[5.0]
  def change
    create_table :shoes do |t|
      t.string :brand
      t.string :price
      t.string :image
      t.string :description

      t.timestamps
    end
  end
end
