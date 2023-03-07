class User < ApplicationRecord
  validates_presence_of :email, :name
  validates_uniqueness_of :email
  has_many :favorites

  def self.generate_key
    SecureRandom.urlsafe_base64
  end
end
