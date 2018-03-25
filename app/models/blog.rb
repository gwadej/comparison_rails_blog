require 'securerandom'

class Blog < ApplicationRecord
  belongs_to :user

  def self.uuid
    SecureRandom.uuid.gsub(/-/, '')
  end
end
