class BookController < ApplicationController

  get '/books/view' do
    @books = Book.all
    erb :'book/show'  
  end 
  
  
  get '/books/add' do
    authenticate
    erb :'book/add'
  end

 

  post '/books/add' do
    a = Author.find_or_create_by(name: params[:name])
    book = Book.new(title: params[:title], year: params[:year], author: a)
    # b = Book.find_or_create_by(title: params[:title], year: params[:year], author: params[:author])
    
    # if book.save
      #if book is saved, add another book or start discussion
  end

  # get '/books/view'
  #   authenticate
  #   @books = Book.all
  #   erb :'book/show'  
  # end

  # get 'books/view/:d'

end