class CommentController < ApplicationController

  ##COMMENTS - polymorphic
  
	post '/comments' do
		authenticate
    user = current_user
    @commentable_id = params[:comment][:commentable_id]
    @commentable_type = params[:comment][:commentable_type]
    @comment_path = params[:comment][:comment_path]
    Comment.create(user: user, content: sanitize(params[:comment][:content]), commentable_id: @commentable_id, commentable_type: @commentable_type)
		redirect "/#{@comment_path}/#{@commentable_id}"
	end







end