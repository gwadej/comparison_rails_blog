class Tag < ApplicationRecord

  belongs_to :post
  has_many :posts
end
