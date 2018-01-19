class ArticlesController < ApplicationController
  before_action :authenticate_user!

  def create
    @article = Article.new(article_params)
    if @article.save
      @article.user_ids = [current_user.id]
      render :show
    else
      render json: { errors: @article.errors.full_messages }, status: 422
    end
  end

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  private

  def article_params
    params.require(:article).permit(:title, :url, :description, category_ids: [])
  end
end
