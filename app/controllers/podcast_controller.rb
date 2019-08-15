class PodcastController < ApplicationController

  get '/podcasts/add' do
    authenticate
    erb :'podcast/add'
  end

  post '/podcasts/add' do
    a = Author.find_or_create_by(name: params[:name])
    podcast = Podcast.new(name: params[:name], episode_title: params[:episode_title], year: params[:year], source: params[:source], author: a)
    # if podcast.save
      
  end
end