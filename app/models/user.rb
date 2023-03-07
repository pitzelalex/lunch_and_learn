class User < ApplicationRecord
  def self.generate_key
    SecureRandom.urlsafe_base64
  end
end
