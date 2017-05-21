class Beacon < ApplicationRecord
  attr_accessor :entered_code

  belongs_to :user, optional: true

  has_many :locations, dependent: :destroy

  enum status: { disabled: 0, enabled: 1, lost: 2, stolen: 3 }

  validates :major, uniqueness: { scope: :minor }
  validates :major, :minor, numericality: { greater_than_or_equal_to: 0 }

  before_save :set_major_minor

  # Uniquely identifies beacon within a single UUID
  def major_minor_string
    "#{major}-#{minor}"
  end

  private

  def set_major_minor
    self.major_minor = "#{major}-#{minor}"
  end
end
