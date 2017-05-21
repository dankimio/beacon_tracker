class User < ApplicationRecord
  has_many :beacons, dependent: :nullify
  has_many :locations, dependent: :nullify

  has_secure_password
  has_secure_token :api_token

  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :name, presence: true

  before_save -> { email&.downcase! }
end
