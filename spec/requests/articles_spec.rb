require 'rails_helper'

RSpec.describe 'Articles API', type: :request do
  let!(:articles) { create_list(:article, 10) }
  let(:article_id) {  articles.first.id }
  let(:test_user) { FactoryBot.create(:user) }
  let(:auth_token) { JWTAuth.encode(test_user.username) }

  describe 'GET /articles' do
    context "when logged in" do
      it 'returns all articles' do
        get '/articles', params: { auth_token: auth_token }
        expect(json).not_to be_empty
        expect(json['articles']).to be_a(Hash)
        expect(json['articles'].size).to eq(10)
      end

      it 'returns success status code' do
        get '/articles', params: { auth_token: auth_token }
        expect(response).to have_http_status(:success)
      end
    end

    context "when not logged in" do
      it 'returns unauthorized status' do
        get '/articles', params: { auth_token: JWTAuth.encode('totally not valid') }
        expect(response).to have_http_status(:unauthorized)
      end
    end
  end



end
