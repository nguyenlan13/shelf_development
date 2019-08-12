class MemberController < ApplicationController

  get '/member' do
    if logged_in?
      erb :'member/home'
    else
      redirect '/login'
    end
  end

  

end