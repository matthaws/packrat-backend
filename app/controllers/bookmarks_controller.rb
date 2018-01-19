class BookmarksController < ApplicationController

  def index
    @articles = current_user.articles
    render 'views/articles/index'
  end

end
