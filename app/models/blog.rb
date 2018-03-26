require 'securerandom'

class Blog < ApplicationRecord
  belongs_to :user
  has_many :posts

  def self.uuid
    SecureRandom.uuid.gsub(/-/, '')
  end
end
