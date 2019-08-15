class ArticleController < ApplicationController

  get '/add-article' do
    authenticate
    erb :'article/add'
  end

  post '/add-article' do
    a = Author.find_or_create_by(name: params[:name])
    article = Article.new(title: params[:title], year: params[:year], source: params[:source], author: a)
    # if article.save
      
  end
end