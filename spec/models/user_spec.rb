# == Schema Information
#
# Table name: users
#
#  id          :integer          not null, primary key
#  username    :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  avatar_url  :string
#  email       :string
#  uid         :string
#  provider    :string
#  oauth_token :string
#

require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_many(:bookmarks).dependent(:destroy)}
  it { should have_many(:articles).through(:bookmarks)}

  it { should validate_presence_of(:username) }

end
