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
    authorize
    @fave_quote = FaveQuote.find_by(id: params[:id])
    if @fave_quote.user_id != current_user.id
      # @access = false
      redirect '/access_denied'    
    end
      # @access = true
      erb :"fave_quote/edit"
  end


  patch '/fave_quotes/:id' do
    authorize
    @quotable_id = params[:fave_quote][:quotable_id]
    @quotable_type = params[:fave_quote][:quotable_type]
    fq_path

    @fave_quote = FaveQuote.find_by(id: params[:id])
    if @fave_quote.user_id != current_user.id
      redirect '/access_denied'      
      else
        # params[:comment][:content] = params[:comment][:content]
       @fave_quote.update(quote: params[:fave_quote][:quote])
      end
        redirect "/#{@quote_path}/#{@quotable_id}"
  end


  delete '/fave_quotes/:id/delete' do
    authorize
    @quotable_id = params[:fave_quote][:quotable_id]
    @quotable_type = params[:fave_quote][:quotable_type]
    fq_path

    @fave_quote = FaveQuote.find_by(id: params[:id])
    if @fave_quote.user_id != current_user.id
      redirect '/access_denied'      
      else
        @fave_quote.delete
        redirect "/#{@quote_path}/#{@quotable_id}"
      end
    end
end

