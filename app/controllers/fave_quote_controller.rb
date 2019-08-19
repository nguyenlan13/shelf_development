class FaveQuoteController < ApplicationController

  ##QUOTES - polymorphic
  
	post '/fave_quotes' do
		authenticate
    user = current_user
    @quotable_id = params[:rating][:ratable_id]
    @quotable_type = params[:rating][:ratable_type]
    @quote_path = params[:rating][:rating_path]
    FaveQuote.create(user: user, quote: params[:fave_quote][:quote], quotable_id: @quotable_id, quotable_type: @quotable_type)
		redirect "/#{@quote_path}/#{@quotable_id}"
	end

end