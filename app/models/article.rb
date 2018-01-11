# == Schema Information
#
# Table name: articles
#
#  id          :integer          not null, primary key
#  title       :string           not null
#  url         :string           not null
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

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
