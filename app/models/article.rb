class Article < ApplicationRecord
  validates :url, presence: true, uniqueness: true
  validates :title, presence: true

  has_many :bookmarks
  has_many :users,
    through: :bookmarks,
    source: :user
    
end
