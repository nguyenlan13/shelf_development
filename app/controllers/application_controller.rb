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

  get '/does_not_exist' do
    'Sorry, the item you are looking for does not exist'
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

    def auth_edit(item)
      authorize
      redirect '/does_not_exist' if !item
      redirect '/access_denied' if item.user_id != current_user.id   
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

    def rate_path
      case @ratable_type
        when "Book"
          @rate_path = "books"
        when "Podcast"
          @rate_path = "podcasts"
        when "Article"
          @rate_path = "articles"
        else
          ""
      end
    end

    def reaction(params:)
      if params.keys.include?("like")
        return 0
      elsif
        params.keys.include?("love")
        return 1
      elsif
        params.keys.include?("enlightened")
        return 2
      elsif
        params.keys.include?("mind blown")
        return 3
      else
        return nil
      end
    end

    def reaction_comment(id:)
      if (reaction = current_user.reactions.find{|r| r.reactable && r.reactable_type == "Comment" && r.reactable.id == id }) && !reaction.nil?
          case reaction.reaction_type
          when 0
              "like"
          when 1
              "love"
          when 2
              "enlightnened"
          when 3
              "mind blown"
          end
      else
          return nil
      end
  end




    end
end
