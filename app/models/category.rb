class Category < ApplicationRecord
  validates :subject, presence: true

  has_many :article_categories
  has_many :articles,
    through: :article_categories,
    source: :article
end
