class User < ApplicationRecord
  validates :username, presence: true

  has_many :bookmarks, dependent: :destroy
  has_many :articles,
    through: :bookmarks,
    source: :article
end
