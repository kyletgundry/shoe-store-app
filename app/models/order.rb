class Order < ApplicationRecord
  belongs_to :shoe, optional: true
  belongs_to :user, optional: true
  has_many :carted_products
  has_many :users, through: :carted_products
  has_many :products, through: :carted_products
  
  def created_time
    created_at.strftime("%A, %b %d")
  end
end
