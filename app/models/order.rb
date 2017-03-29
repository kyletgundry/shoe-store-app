class Order < ApplicationRecord
  belongs_to :shoe, optional: true
  belongs_to :user, optional: true
  has_many :carted_shoes
  has_many :users, through: :carted_shoes
  has_many :shoes, through: :carted_shoes
  
  def created_time
    created_at.strftime("%A, %b %d")
  end
end
