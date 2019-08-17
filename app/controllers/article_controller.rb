class ArticleController < ApplicationController

  get '/articles/new' do
    authenticate
    erb :'article/new'
  end

  post '/articles/new' do
    a = Author.find_or_create_by(name: params[:name])
    article = Article.new(title: params[:title], year: params[:year], source: params[:source], author: a)
    # if article.save
      
  end
end