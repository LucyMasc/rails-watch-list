class List < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  # should destroy child saved movies when destroying self
  # When you delete a list, you should delete all associated bookmarks (but not the movies as they can be referenced in other lists).
  has_many :bookmarks, dependent: :destroy
  has_many :movies, through: :bookmarks

  # order matters, bookmarks cannot come after movies in this case, look:
  # Cannot have a has_many :through association 'List#movies' which goes through 'List#bookmarks' before the through association is defined.
end
