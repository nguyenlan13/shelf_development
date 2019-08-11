class SessionsController < ApplicationController
  
  get '/signup' do
    erb :'sessions/signup'
  end

  post '/signup' do
    user = User.new(params[:user])
    if user.save
      session[:user_id] = user.id
    end
    erb :'member/home'
  end
  
  get '/login' do
    erb :'sessions/login'
  end

  post '/login' do
    user = User.find_by(username: params[:username])
    # binding.pry
    if !!user && user.authenticate(params[:password])
      session[:user_id] = user.id
      erb :'member/home'
    else
      erb :'sessions/login'
    end
  end




end

