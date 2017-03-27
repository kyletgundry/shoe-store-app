class Category < ApplicationRecord
  has_many :category_shoes
  has_many :shoes, through: :category_shoes
end
