class ReactionController < ApplicationController

  ##REACTIONS - polymorphic (CAN REACT TO A FAVE QUOTE AND COMMMENTS)

	post '/reactions' do
		authorize
		user = current_user
	#   @reactable_id = params[:reaction][:reactable_id]
  #   @reactable_type = params[:reaction][:reactable_type]
		@comment = Comment.all
		@fave_quote = FaveQuote.all
    Reaction.create(user: user, comment: @comment, type: params[:type])
		# redirect "/#{@rating_path}/#{@ratable_id}"
	end


	  # post '/comments/:id/reactions' do
  #   user = current_user
 
  #   @comment = Comment.find_by(id: params[:id])
  #   auth_edit(@comment)
  #   Reaction.create(user: user, comment: @comment, reaction_type: params[:reaction_type])
  #   # redirect "/#{@rating_path}/#{@ratable_id}"
  # end
end