class MemberController < ApplicationController

  get '/member' do
    erb :'member/home'
  end

end