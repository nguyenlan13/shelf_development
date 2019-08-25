class FaveQuoteController < ApplicationController

  ##QUOTES - polymorphic
  
	post '/fave_quotes' do
		authorize
    user = current_user
    @quotable_id = params[:fave_quote][:quotable_id]
    @quotable_type = params[:fave_quote][:quotable_type]
    @quote_path = params[:fave_quote][:quote_path]
    FaveQuote.create(user: user, quote: params[:fave_quote][:quote], quotable_id: @quotable_id, quotable_type: @quotable_type)
    redirect "/#{@quote_path}/#{@quotable_id}"
	end


  get '/fave_quotes/:id/edit' do
    @fave_quote = FaveQuote.find_by(id: params[:id])
    auth_edit(@fave_quote)
      erb :"fave_quote/edit"
  end


  patch '/fave_quotes/:id' do
    @quotable_id = params[:fave_quote][:quotable_id]
    @quotable_type = params[:fave_quote][:quotable_type]
    fq_path

    @fave_quote = FaveQuote.find_by(id: params[:id])
    auth_edit(@fave_quote)
        # need to sanitize params[:comment][:content] = params[:comment][:content]
    @fave_quote.update(quote: params[:fave_quote][:quote])
      redirect "/#{@quote_path}/#{@quotable_id}"
  end


  delete '/fave_quotes/:id' do
    @quotable_id = params[:fave_quote][:quotable_id]
    @quotable_type = params[:fave_quote][:quotable_type]
    fq_path

    @fave_quote = FaveQuote.find_by(id: params[:id])
    auth_edit(@fave_quote)
    @fave_quote.delete
    redirect "/#{@quote_path}"
  end
end



