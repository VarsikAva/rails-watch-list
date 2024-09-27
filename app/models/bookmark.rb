class Bookmark < ApplicationRecord
  validates :comment, presence: true, length: { minimum: 6 }
  validates :movie_id, :list_id, presence: true
  validates :movie_id, uniqueness: { scope: :list_id }
  validates :list, presence: true
  belongs_to :movie
  belongs_to :list
end
