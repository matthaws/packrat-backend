# == Schema Information
#
# Table name: article_categories
#
#  id          :integer          not null, primary key
#  article_id  :integer          not null
#  category_id :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class ArticleCategory < ApplicationRecord
  validates :article, :category, presence: true

  belongs_to :article
  belongs_to :category
end
