class Bookmark < ApplicationRecord
  validates :user, :article, presence: true

  belongs_to :user
  belongs_to :article
end
