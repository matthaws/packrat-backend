class Article < ApplicationRecord
  validates :url, presence: true, uniqueness: true
  validates :title, presence: true

  has_many :bookmarks, dependent: :destroy

  has_many :users,
    through: :bookmarks,
    source: :user

  has_many :article_categories, dependent: :destroy
  
  has_many :categories,
    through: :article_categories,
    source: :category
end
