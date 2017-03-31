class CartedShoe < ApplicationRecord
  belongs_to :user
  belongs_to :shoe
  belongs_to :order, optional: true

  validates :CartedShoe, presence: true
  validates :CartedShoe, numericality: {greater_than: 0 }

end
