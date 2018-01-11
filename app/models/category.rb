# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  subject    :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Category < ApplicationRecord
  validates :subject, presence: true

  has_many :article_categories, dependent: :destroy
  has_many :articles,
    through: :article_categories,
    source: :article
end
