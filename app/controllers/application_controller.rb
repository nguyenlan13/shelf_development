class ApplicationController < Sinatra::Base

  configure do
    set :views, 'app/views'
    set :public_folder, 'public'
    enable :sessions
    set :session_secret, SESSION_SECRET
  end


  get '/' do
    if logged_in?
      redirect '/home'
      return
    end
    erb :index
  end

  get '/logout' do
    session.clear
    redirect '/'
  end


  helpers do

    def logged_in?
      !!session[:user_id]
    end

    def current_user
      User.find_by(id: session[:user_id])
    end

    def authenticate
      if !logged_in?
        redirect '/login'
      end
    end

  end
end
