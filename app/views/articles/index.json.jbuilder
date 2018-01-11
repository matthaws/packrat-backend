json.articles do
  @articles.each do |article|
    json.set! article.id do
      json.partial! 'articles/article', article: article
    end
  end
end
