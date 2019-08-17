class BookController < ApplicationController

  
  get '/books/new' do
    authenticate
    @books = Book.all
    erb :'book/new'
  end

  post '/books/new' do
    authenticate
    book_params = params[:book]
    author = Author.find_or_create_by(name: book_params[:author])
    book = Book.find_by(title: book_params[:title], year: book_params[:year], author: author)
  #  binding.pry
    if book
      #need to fix this so it doesnt show up everytime
      @duplicate = true
      @books = Book.all
      erb :'book/new'
    else
      book = Book.create(title: book_params[:title], year: book_params[:year], author: author)
      redirect '/books/#{book.id}'
    end
  end


  get '/books/:id' do
    authenticate
    book = book.id



    # erb :'book/show'
    
  end

  post '/books/:id/comments' do
    user = current_user
    @comment = Comment.new(user: user, content: params[:content], commentable: params[:commentable])

    erb :'book/comments'
  end
end