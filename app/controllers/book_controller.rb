class BookController < ApplicationController

	
	get '/books' do
		authenticate
		@books = Book.all
		erb :'book/index'
	end
		
	get '/books/new' do
		authenticate
		@books = Book.all
		erb :'book/new'
	end

	post '/books' do
		authorize
		book_params = params[:book]
		author = Author.find_or_create_by(name: book_params[:author])
		book = Book.find_by(title: book_params[:title], year: book_params[:year], author: author)
		if book
			@duplicate = true
			@books = Book.all
			erb :'book/new'
		else
			@duplicate = false
			@book = Book.create(title: book_params[:title], year: book_params[:year], author: author)
			if @book.id
				redirect "/books/#{@book.id}"
			else
				erb :'book/new'
			end
		end
	end

	get '/books/:id' do
		authorize
		@book = Book.find(params[:id])
		if !@book
			redirect "/books"
			return
		end
		@user = current_user
		@author = @book.author
		@comments = @book.comments
		@ratings = @book.ratings
		@fave_quotes = @book.fave_quotes
		@commentable_type = "books"
		@quotable_type = "books"
		@ratable_type = "books"
		@avg_rating = @ratings.average(:rate)
		erb :'book/show'
	end


##COMMENTS - polymorphic

	# get '/books/:id/comments/new' do
	# 	authenticate
	# 	@commentable = Book.find_by(id: params[:id])
	# 	erb :'comment/new'
	# end

	# post '/books/:id/comments' do
	# 	authenticate
	# 	user = current_user
	# 	@commentable_type = "books"
	# 	@commentable = Book.find_by(id: params[:id])
	# 	@comment = Comment.create(user: user, content: params[:comment][:content], commentable: @commentable)
	# 	redirect "/#{@commentable_type}/#{@commentable.id}"
	# end

	# get '/books/:id/comments/:comment_id' do
	# 	authenticate
	# 	@user = current_user
	# 	@commentable = Book.find_by(id: params[:id])
	# 	@comment = Comment.find_by(id: params[:comment_id], commentable: @commentable)
	# 	erb :'comment/show'
	# end

##RATINGS - polymorphic

	# get 'books/:id/ratings/new' do
	# 	authenticate
	# 	@ratable = Book.find_by(id: params[:id])
	# 	erb :'rating/new'
	# end



	# get '/books/:id/ratings/:rating_id' do
	# 	authenticate
	# 	@user = current_user
	# 	@ratable = Book.find_by(id: params[:id])
	# 	@rating = Rating.find_by(id: params[:rating_id], ratable: @ratable)
	# 	# @avg_rating = @ratable.ratings.average(:rate)
	# 	erb :'rating/show'
	# end



	#quotes - polymorphic




	#reactions - only on comments and replies


end

