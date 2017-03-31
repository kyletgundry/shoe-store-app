class Shoe < ApplicationRecord
  belongs_to :supplier
  has_many :images
  has_many :category_shoes
  has_many :categories, through: :category_shoes
  has_many :carted_shoes
  has_many :users, through: :carted_shoes
  has_many :orders, through: :carted_shoes

  validates :brand, presence: true
  validates :brand, uniqueness: true
  validates :price, presence: true
  validates :price, numericality: true
  validates :description, presence: true
  validates :description, length: { maximum: 500 }
  
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
