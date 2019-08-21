class UserController < ApplicationController

  get '/home' do
    authenticate
    @user = current_user
    @fave_quotes = FaveQuote.all
    erb :'user/home'
  end

end