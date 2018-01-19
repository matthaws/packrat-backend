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

FactoryBot.define do
  factory :article do
    url { Faker::Internet.url }
    title { Faker::Book.title }
    description { Faker::Dune.quote }
  end
end
