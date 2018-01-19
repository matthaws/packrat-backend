require 'rails_helper'

RSpec.describe 'Auth API' do
  let(:test_user) { FactoryBot.build(:user) }

  it 'can log in with github' do
    sign_in_with_github(test_user)
    expect(response.status).to eq(302)
    expect(response.request.params["name"]).to eq(test_user.username)
    get '/auth/github/callback', params: response.request.params
    expect(json['username']).to eq(test_user.username)
    expect(json['email']).to eq(test_user.email)
    expect(json['auth_token']).to eq(JWTAuth.encode(test_user.username))
  end

end
