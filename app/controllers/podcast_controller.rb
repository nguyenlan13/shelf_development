class PodcastController < ApplicationController

    get '/podcasts' do
      authorize
      @podcasts = Podcast.all
      erb :'podcast/index'
    end
      
    get '/podcasts/new' do
      authorize
      @podcasts = Podcast.all
      erb :'podcast/new'
    end
  
    post '/podcasts' do
      authorize
      podcast_params = params[:podcast]
      author = Author.find_or_create_by(name: podcast_params[:author])
      podcast = Podcast.find_by(name: podcast_params[:name], episode_title: podcast_params[:episode_title], year: podcast_params[:year], source: podcast_params[:source], author: author)
      if podcast
        @duplicate = true
        @podcasts = Podcast.all
        erb :'podcast/new'
      else
        @duplicate = false
        @podcast = Podcast.create(name: podcast_params[:name], episode_title: podcast_params[:episode_title], year: podcast_params[:year], source: podcast_params[:source], author: author)
        if @podcast.id
          redirect "/podcasts/#{@podcast.id}"
        else
          erb :'podcast/new'
        end
      end
    end
        
    get '/podcasts/:id' do
      authorize
      @podcast = Podcast.find(params[:id])
      if !@podcast
        redirect "/does_not_exist"
        return
      end
      @user = current_user
      @author = @podcast.author
      @comments = @podcast.comments
      @ratings = @podcast.ratings
      @fave_quotes = @podcast.fave_quotes
      @commentable_type = "podcasts"
      @quotable_type = "podcasts"
      @ratable_type = "podcasts"
      @avg_rating = @ratings.average(:rate)
      erb :'podcast/show'
    end
end