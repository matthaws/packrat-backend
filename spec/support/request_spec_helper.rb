module RequestSpecHelper
  def json
    JSON.parse(response.body)
  end

  def sign_in_with_github(user)
    OmniAuth.config.add_mock(:github, omniauth_hash_for(user))
    post '/auth/github', params: {name: user.username, email: user.email }

  end

  def omniauth_hash_for(user)
    {
      provider: 'github',
      uid: 1337,
      credentials: {
        token: '123ABC456DEF'
      },
      info: {
        name: user.username,
        email: user.email
      }
    }
  end
end
