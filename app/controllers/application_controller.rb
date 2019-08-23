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
    erb :'index'
  end

  get '/logout' do
    session.clear
    redirect '/'
  end

  get '/access_denied' do
    'Sorry, you are not authorized to edit.'
  end

  not_found do
    'This is nowhere to be found.'
  end

  error ActiveRecord::RecordNotFound do
    status 404
    'This is nowhere to be found.'
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

    def authorize
      if !logged_in? || current_user.nil?
          redirect '/login'
      end
    end

    def esc(text)
      Rack::Utils.escape_html(text)
    end


    def comm_path 
      case @commentable_type
        when "Book"
          @comment_path = "books"
        when "Podcast"
          @comment_path = "podcasts"
        when "Article"
          @comment_path = "articles"
        else
          ""
      end
    end
    


    def fq_path
      case @quotable_type
        when "Book"
          @quote_path = "books"
        when "Podcast"
          @quote_path = "podcasts"
        when "Article"
          @quote_path = "articles"
        else
          ""
        end
      end
    end
end
