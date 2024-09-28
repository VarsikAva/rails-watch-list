class Movie < ApplicationRecord
  validates :title, :overview, presence: true, uniqueness: true
  has_many :bookmarks, dependent: :restrict_with_error
  validate :no_bookmarks_exist

  private

  def no_bookmarks_exist
    if bookmarks.any?
      errors.add(:base, "Cannot delete movie with associated bookmarks")
    end
  end
end
