class ReactionController < ApplicationController

	post '/reactions' do
		authenticate
    user = current_user
    @comment = Comment.all
    Reaction.create(user: user, comment: @comment, type: params[:type])
		# redirect "/#{@rating_path}/#{@ratable_id}"
	end

end