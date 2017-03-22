class AddImageIdToShoesModel < ActiveRecord::Migration[5.0]
  def change
    add_column :shoes, :image_id, :integer
  end
end
