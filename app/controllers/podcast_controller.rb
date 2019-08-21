class PodcastController < ApplicationController

    get '/podcasts' do
      authenticate
      @podcasts = Podcast.all
      erb :'podcast/index'
    end
      
    get '/podcasts/new' do
      authenticate
      @podcasts = Podcast.all
      erb :'podcast/new'
    end
  
    post '/podcasts/new' do
      authenticate
      podcast_params = params[:podcast]
      author = Author.find_or_create_by(name: podcast_params[:author])
      podcast = Podcast.find_by(title: podcast_params[:name], episode_title: podcast_params[:episode_title], year: podcast_params[:year], source: podcast_params[:source], author: author)
      if podcast
        @duplicate = true
        @podcasts = Podcast.all
        erb :'podcast/new'
      else
        @duplicate = false
        podcast = Podcast.create(title: podcast_params[:title], year: podcast_params[:year], source: podcast_params[:source], author: author)
        redirect "/podcasts/#{podcast.id}"
      end
    end
        
    get '/podcasts/:id' do
      authenticate
      @podcast = Podcast.find(params[:id])
      if !@podcast
        redirect "/podcasts"
        return
      end
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