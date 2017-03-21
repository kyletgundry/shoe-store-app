class Supplier < ApplicationRecord
  has_many :shoes
#  def products
#   Shoe.where(supplier_id: :id)
#  end
end
