class User < ApplicationRecord
  validates_presence_of :email, :name
  validates_uniqueness_of :email

  def self.generate_key
    SecureRandom.urlsafe_base64
  end
end
