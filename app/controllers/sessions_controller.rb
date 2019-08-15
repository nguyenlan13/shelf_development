class SessionsController < ApplicationController
  
 
  get '/signup' do
    if logged_in?
      redirect '/user'
      return
    end
    
    @failed = false
    erb :'sessions/signup'
  end


  post '/signup' do
    if logged_in?
      redirect '/user'
      return
    end
    user = User.new(params[:user])
    if user.save
      session[:user_id] = user.id
      redirect '/user'
    else
      @failed = true
      erb :'sessions/signup'
    end
  end
  
  get '/login' do
    if logged_in?
      redirect '/user'
      return
    end
    @failed = false
    erb :'sessions/login'
  end

  post '/login' do
    user = User.find_by(username: params[:username])
    # binding.pry
    if !!user && user.authenticate(params[:password])
      session[:user_id] = user.id
      session[:name] = user.name
      redirect '/user'
    else
      @failed = true
      erb :'sessions/login'
    end
  end

end

