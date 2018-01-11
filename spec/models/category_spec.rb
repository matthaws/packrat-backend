require 'rails_helper'

RSpec.describe Category, type: :model do
  it { should have_many(:article_categories).dependent(:destroy)}
  it { should have_many(:articles).through(:article_categories)}

  it { should validate_presence_of(:subject) }

end
