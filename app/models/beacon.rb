class Beacon < ApplicationRecord
  attr_accessor :entered_code

  belongs_to :user, optional: true

  enum status: { disabled: 0, enabled: 1, lost: 2, stolen: 3 }

  validates :major, uniqueness: { scope: :minor }
  validates :major, :minor, numericality: { greater_than_or_equal_to: 0 }
  validates :user, presence: true, if: 'entered_code.present?'
  validate :validate_code, if: 'entered_code.present?'

  def self.find_by_major_minor_string!(major_minor_string)
    raise ActiveRecord::RecordNotFound unless major_minor_string.present?

    major, minor = major_minor_string.split('-').map(&:to_i)
    find_by!(major: major, minor: minor)
  end

  # Uniquely identifies beacon within a single UUID
  def major_minor_string
    "#{major}-#{minor}"
  end

  private

  def validate_code
    errors.add(:code, 'does not match') if self.code != entered_code
  end
end
