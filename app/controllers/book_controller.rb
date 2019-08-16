class BookController < ApplicationController

  
  get '/books/add' do
    authenticate
    @books = Book.all
    erb :'book/add'
  end

  post '/books/add' do
    author = Author.find_or_create_by(name: params[:name])
    book = Book.find_by(title: params[:title], year: params[:year], author: author)
    if book
      @duplicate = true
      erb :'book/add'
    else
      book = Book.create(title: params[:title], year: params[:year], author: author)
      redirect '/books/#{book.id}'
    end
  end


  get 'books/:id' do
    authenticate
    



  end

  # if !book
    #   book = Book.new(title: params[:title], year: params[:year], author: author.name)
    # book.save
      #if book is saved, add another book or start discussion



  # get '/books/view'
  #   authenticate
  #   @books = Book.all
  #   erb :'book/show'  
  # end

  # get 'books/view/:d'

end