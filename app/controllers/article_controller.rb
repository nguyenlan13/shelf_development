class ArticleController < ApplicationController

  get '/articles' do
		authorize
		@articles = Article.all
		erb :'article/index'
	end
    
  get '/articles/new' do
    authorize
    @articles = Article.all
    erb :'article/new'
  end

  post '/articles' do
		authorize
		article_params = params[:article]
    author = Author.find_or_create_by(name: article_params[:author])
    article = Article.find_by(title: article_params[:title], year: article_params[:year], source: article_params[:source], author: author)
    if article
      @duplicate = true
			@articles = Article.all
			erb :'article/new'
		else
			@duplicate = false
			@article = Article.create(title: article_params[:title], year: article_params[:year], source: article_params[:source], author: author)
			if @article.id
				redirect "/articles/#{@article.id}"
			else
				erb :'article/new'
			end
    end
  end
      
	get '/articles/:id' do
		authorize
		@article = Article.find_by(id: params[:id])
		if !@article
			redirect "/does_not_exist"
			return
		end
		@user = current_user
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