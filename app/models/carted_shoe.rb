class CartedShoe < ApplicationRecord
  belongs_to :user
  belongs_to :shoe
  belongs_to :order, optional: true
end
