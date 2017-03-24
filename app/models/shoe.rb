class Shoe < ApplicationRecord
  belongs_to :supplier
  has_many :images
  has_many :orders
  def discounted?
    if price.to_f < 50
      return true
    else
      return false
    end
  end

#  def supplier
#   Shoe.find_by(id: :supplier_id)
#  end
end
