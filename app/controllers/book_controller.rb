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
end

