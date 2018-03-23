require 'securerandom'
class User < ApplicationRecord
  has_secure_password

  def self.uuid
    SecureRandom.uuid.gsub(/-/, '')
  end
end
