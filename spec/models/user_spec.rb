require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_many(:bookmarks).dependent(:destroy)}
  it { should have_many(:articles).through(:bookmarks)}

  it { should validate_presence_of(:username) }

end
