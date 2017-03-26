class Order < ApplicationRecord
  belongs_to :shoe, optional: true
  belongs_to :user, optional: true

  def created_time
    created_at.strftime("%A, %b %d")
  end
end
