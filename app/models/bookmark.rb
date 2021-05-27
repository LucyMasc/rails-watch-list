class Bookmark < ApplicationRecord
  belongs_to :movie
  belongs_to :list

  # comment cannot be shorter than 6 characters:
  validates :comment, length: { minimum: 6 }

  # is unique for a given movie/list couple:
  validates :movie_id, uniqueness: { scope: :list_id, message: "already in the list, choose another" }
end
