class BookController < ApplicationController

  get '/add-book' do
    erb :'book/add'
  end

  post '/add-book' do
    a = Author.find_or_create_by(name: params[:name])
    book = Book.new(title: params[:title], year: params[:year], author: a)
    # if book.save
      
  end
end