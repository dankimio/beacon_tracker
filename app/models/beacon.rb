class Beacon < ApplicationRecord
  belongs_to :user, optional: true

  enum status: { on_sale: 0, disabled: 1, enabled: 2, lost: 3, stolen: 4 }

  validates :major, uniqueness: { scope: :minor }
  validates :major, :minor, numericality: { greater_than_or_equal_to: 0 }

  def self.find_by_major_minor_string!(major_minor_string)
    raise ActiveRecord::RecordNotFound unless major_minor_string.present?

    major, minor = major_minor_string.split('-').map(&:to_i)
    find_by!(major: major, minor: minor)
  end

  def activate(user, code)
    return false if self.user.present?
    return false if self.code != code

    ActiveRecord::Base.transaction do
      update_attribute(:user, user)
      disabled!
    end
  end

  # Uniquely identifies beacon within a single UUID
  def major_minor_string
    "#{major}-#{minor}"
  end
end
