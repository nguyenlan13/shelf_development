class FaveQuoteController < ApplicationController

  ##QUOTES - polymorphic
  
	post '/fave_quotes' do
		authenticate
    user = current_user
    @quotable_id = params[:fave_quote][:quotable_id]
    @quotable_type = params[:fave_quote][:quotable_type]
    @quote_path = params[:fave_quote][:quote_path]
    FaveQuote.create(user: user, quote: sanitize(params[:fave_quote][:quote]), quotable_id: @quotable_id, quotable_type: @quotable_type)
		redirect "/#{@quote_path}/#{@quotable_id}"
	end

end