class Post < ApplicationRecord
  belongs_to :blog

  belongs_to :tag
  has_many :tags
end
