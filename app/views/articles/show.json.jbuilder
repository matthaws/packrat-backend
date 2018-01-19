json.set! @article.id do
  json.partial! 'articles/article', article: @article
end
