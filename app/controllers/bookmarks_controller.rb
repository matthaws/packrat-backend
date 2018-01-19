class BookmarksController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @articles = current_user.articles
    render 'views/articles/index'
  end

end
