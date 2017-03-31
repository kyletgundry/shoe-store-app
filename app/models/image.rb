class Image < ApplicationRecord
  belongs_to :shoe

  validates :url, presence: true
end
