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
		authenticate
		book_params = params[:book]
		author = Author.find_or_create_by(name: book_params[:author])
		book = Book.find_by(title: book_params[:title], year: book_params[:year], author: author)
		# binding.pry
		if book
			@duplicate = true
			@books = Book.all
			erb :'book/new'
		else
			@duplicate = false
			book = Book.create(title: book_params[:title], year: book_params[:year], author: author)
			redirect "/books/#{book.id}"
		end
	end

	get '/books/:id' do
		authenticate
		@book = Book.find_by(id: params[:id])
		if !@book
			redirect "/books"
			return
		end
		@author = Author.find_by(id: @book.author.id)
		@comments = Comment.where(commentable: @book).all
		@rating = Rating.where(ratable: @book)
		erb :'book/show'
	end


##COMMENTS

	get '/books/:id/comments/new' do
		authenticate
		@commentable = Book.find_by(id: params[:id])
		erb :'comment/new'
	end

	post '/books/:id/comments' do
		authenticate
		user = current_user
		@commentable_type = "books"
		@commentable = Book.find_by(id: params[:id])
		@comment = Comment.create(user: user, content: params[:comment][:content], commentable: @commentable)
		redirect "/#{@commentable_type}/#{@commentable.id}"
	end

	get '/books/:id/comments/:comment_id' do
		authenticate
		@user = current_user
		@commentable = Book.find_by(id: params[:id])
		@comment = Comment.find_by(id: params[:comment_id], commentable: @commentable)
		erb :'comment/show'
	end

##RATINGS

	get 'books/:id/ratings/new' do
		authenticate
		@ratable = Book.find_by(id: params[:id])
		erb :'rating/new'
	end

	post '/books/:id/ratings' do
		authenticate
		user = current_user
		@ratable_type = "books"
		@ratable = Book.find_by(id: params[:id])
		@rating = Rating.create(user: user, content: params[:rating][:rate], ratable: @ratable)
		redirect "/#{@ratable_type}/#{@ratable.id}"
	end

	get '/books/:id/ratings/:rating_id' do
		authenticate
		@user = current_user
		@ratable = Book.find_by(id: params[:id])
		@rating = Rating.find_by(id: params[:rating_id], ratable: @ratable)
		erb :'rating/show'
	end



	#quotes - polymorphic




	#reactions - only on comments and replies


end

