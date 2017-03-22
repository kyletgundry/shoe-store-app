class RemoveImageModelFromShoes < ActiveRecord::Migration[5.0]
  def change
    remove_column :shoes, :image_id, :integer
    remove_column :shoes, :image, :string
  end
end
