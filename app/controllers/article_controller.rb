class ArticleController < ApplicationController

  get '/articles' do
		authenticate
		@articles = Article.all
		erb :'article/index'
	end
    
  get '/articles/new' do
    authenticate
    @articles = Article.all
    erb :'article/new'
  end

  post '/articles/new' do
    authenticate
    article_params = params[:article]
    author = Author.find_or_create_by(name: sanitize(article_params[:author]))
    article = Article.find_by(title: article_params[:title], year: article_params[:year], source: article_params[:source], author: author)
    if article
      @duplicate = true
			@articles = Article.all
			erb :'article/new'
		else
			@duplicate = false
			article = Article.create(title: sanitize(article_params[:title]), year: sanitize(article_params[:year]), source: sanitize(article_params[:source]), author: author)
			redirect "/articles/#{article.id}"
    end
  end
      
	get '/articles/:id' do
		authenticate
		@article = Article.find(params[:id])
		if !@article
			redirect "/articles"
			return
		end
		@author = @article.author
		@comments = @article.comments
		@ratings = @article.ratings
		@fave_quotes = @article.fave_quotes
    @commentable_type = "articles"
    @quotable_type = "articles"
		@ratable_type = "articles"
		@avg_rating = @ratings.average(:rate)
		erb :'article/show'
	end
end