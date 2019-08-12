class MemberController < ApplicationController

  get '/member' do
    authenticate
    erb :'member/home'
  end



end