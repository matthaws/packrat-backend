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

  describe 'POST /articles' do
    let!(:new_article) { FactoryBot.build(:article) }
    context 'when logged in' do
      it 'creates a new article with valid params' do
        post '/articles', params: {
          article: {
            title: new_article.title,
            url: new_article.url,
            description: new_article.description
          },
          auth_token: auth_token
        }
        expect(response).to have_http_status(:success)
        article = Article.find_by(url: new_article.url)
        expect(article).to be_a(Article)
        expect(json[article.id.to_s]['title']).to eq(new_article.title)
      end

      it 'should automatically bookmark article for current user' do
        post '/articles', params: {
          article: {
            title: new_article.title,
            url: new_article.url,
            description: new_article.description
          },
          auth_token: auth_token
        }
        article = Article.find_by(url: new_article.url)
        expect(User.find_by_username(test_user.username).articles).to include(article)
      end

      it 'responds with errors with invalid params' do
        post '/articles', params: {
          article: {
            title: 'An article with no URL'
          },

          auth_token: auth_token
        }
        expect(response).to have_http_status(422)
        expect(json['errors']).to include("Url can't be blank")
      end
    end

    context 'when not logged in' do
      it 'returns unauthorized status' do
        get '/articles', params: { auth_token: JWTAuth.encode('totally not valid') }
        expect(response).to have_http_status(:unauthorized)
      end
    end
  end

end
