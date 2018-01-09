class User < ApplicationRecord
  validates :username, presence: true

  has_many :bookmarks
  has_many :articles,
    through: :bookmarks,
    source: :article
end
