class Admin < ApplicationRecord
  # Include devise modules
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
end
