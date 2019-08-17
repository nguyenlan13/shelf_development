class PodcastController < ApplicationController

  get '/podcasts/new' do
    authenticate
    erb :'podcast/new'
  end

  post '/podcasts/new' do
    a = Author.find_or_create_by(name: params[:name])
    podcast = Podcast.new(name: params[:name], episode_title: params[:episode_title], year: params[:year], source: params[:source], author: a)
    # if podcast.save
      
  end
end