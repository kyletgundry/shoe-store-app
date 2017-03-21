class Shoe < ApplicationRecord
  def discounted?
    if price.to_f < 50
      return true
    else
      return false
    end
  end
end
