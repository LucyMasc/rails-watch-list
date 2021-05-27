class Movie < ApplicationRecord
  validates :title, presence: true, uniqueness: true
  validates :overview, presence: true

  # should not be able to destroy self if has bookmarks children
  has_many :bookmarks
end
