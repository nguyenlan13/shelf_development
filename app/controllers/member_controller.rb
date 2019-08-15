class MemberController < ApplicationController

  get '/member' do
    authenticate
    @user = current_user
    erb :'member/home'
  end

  get '/share' do
    authenticate
    erb :'member/share'
  end




end