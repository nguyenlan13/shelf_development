class AuthorController < ApplicationController

  get '/authors' do
		authenticate
    @authors = Author.all
		erb :'author/index'
  end
end