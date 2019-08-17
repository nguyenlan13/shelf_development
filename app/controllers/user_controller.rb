class UserController < ApplicationController

  get '/home' do
    authenticate
    @user = current_user
    erb :'user/home'
  end

end