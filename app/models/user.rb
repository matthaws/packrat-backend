class User < ApplicationRecord
  validates :username, presence: true

  has_many :bookmarks, dependent: :destroy
  has_many :articles,
    through: :bookmarks,
    source: :article

  def self.from_omniauth(auth)
    self.where(provider: auth.provider, uid: auth.uid).first_or_initialize.tap do |user|
      debugger
      user.email = auth.info.email
      user.uid = auth.uid
      user.provider = auth.provider
      user.avatar_url = auth.info.image
      user.username = auth.info.name
      user.oauth_token = auth.credentials.token
      user.save!
    end
  end
end
