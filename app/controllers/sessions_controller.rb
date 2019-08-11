class SessionsController < ApplicationController
  
  get '/signup' do
    erb :'sessions/signup'
  end
  
  get '/login' do
    erb :'sessions/login'
  end

  post '/login' do
    user = User.find_by(username: params[:username])
    if !!@user && authenticate(params[:password])
      sessions[:user_id] = user.id
       erb :'member/home'
    else
      erb :'sessions/login'
    end
  end




end

