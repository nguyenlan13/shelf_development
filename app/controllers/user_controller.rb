class UserController < ApplicationController

  get '/home' do
    authorize
    @user = current_user
    @fave_quotes = FaveQuote.all
    erb :'user/home'
  end

  post '/search' do
    authorize
    @books = Book.where("title LIKE ?", params[:book_search])
    erb :'book/index'
  end
end