class MemberController < ApplicationController

  get '/member' do
    authenticate
    erb :'member/home'
  end

  get '/share' do
    erb :'member/share'
  end






end