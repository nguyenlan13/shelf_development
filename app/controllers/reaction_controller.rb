class ReactionController < ApplicationController

	post '/reactions' do
		authorize
    user = current_user
		@comment = Comment.all
		@fave_quote = FaveQuote.all
    Reaction.create(user: user, comment: @comment, type: params[:type])
		# redirect "/#{@rating_path}/#{@ratable_id}"
	end

end