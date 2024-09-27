class Movie < ApplicationRecord
  validates :title, :overview, presence: true, uniqueness: true
  validates :title, uniqueness: true
  validates :rating, numericality: { in: 0..10 }
  has_many :bookmarks, dependent: :restrict_with_error
  validate :has_no_bookmarks, on: :destroy

  private

  def has_no_bookmarks
    if bookmarks.any?
      errors.add(:base, "Cannot destroy movie with associated bookmarks")
    end
  end
end
