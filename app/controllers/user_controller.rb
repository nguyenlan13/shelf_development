class UserController < ApplicationController

  get '/user' do
    authenticate
    @user = current_user
    erb :'user/home'
  end

  get '/user/share' do
    authenticate
    erb :'user/share'
  end

  # get '/share'


end