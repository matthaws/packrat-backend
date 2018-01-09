class ArticleCategory < ApplicationRecord
  validates :article, :category, presence: true

  belongs_to :article
  belongs_to :category
end
