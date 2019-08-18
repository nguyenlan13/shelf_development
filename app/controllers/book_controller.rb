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
    erb :'book/show'
  end

  get '/books/:id/comments/new' do
    authenticate
    @book = Book.find_by(id: params[:id])
    erb :'comment/new'
  end

  post '/books/:id/comments' do
    user = current_user
    @book = Book.find_by(id: params[:id])
    @comment = Comment.create(user: user, content: params[:comment][:content], commentable: @book)
    redirect "/books/#{@book.id}/comments/#{@comment.id}"
  end

  get '/books/:id/comments/:comment_id' do
    authenticate
    @user = current_user
    @book = Book.find_by(id: params[:id])
    @comment = Comment.find_by(commentable: @book)
    erb :'comment/show'
  end

end

