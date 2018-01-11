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

require 'rails_helper'

RSpec.describe Article, type: :model do
  it { should have_many(:bookmarks).dependent(:destroy) }
  it { should have_many(:users).through(:bookmarks) }
  it { should have_many(:article_categories).dependent(:destroy) }
  it { should have_many(:categories).through(:article_categories) }

  it { should validate_presence_of(:url) }
  it { should validate_presence_of(:title) }

  subject { FactoryBot.build(:article) }
  it { should validate_uniqueness_of(:url) }
end
