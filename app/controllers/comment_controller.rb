class CommentController < ApplicationController

  ##COMMENTS - polymorphic
  
	post '/comments' do
		authorize
    user = current_user
    @commentable_id = params[:comment][:commentable_id]
    @commentable_type = params[:comment][:commentable_type]
    @comment_path = params[:comment][:comment_path]
    Comment.create(user: user, content: params[:comment][:content], commentable_id: @commentable_id, commentable_type: @commentable_type)
    redirect "/#{@comment_path}/#{@commentable_id}"
	end

  # post '/comments/:id/replies' do
  #   authorize
  #   if @comment = Comment.find_by(id: params[:id])
  #       user = current_user
  #       @commentable_type = "Comment"

  #       redirect "/#{@comment_path}/#{@commentable_id}"

  #   end
  # end 


  get '/comments/:id/edit' do
    @comment = Comment.find_by(id: params[:id])
    auth_edit(@comment)
    erb :"comment/edit"
  end


  patch '/comments/:id' do
    @commentable_id = params[:comment][:commentable_id]
    @commentable_type = params[:comment][:commentable_type]
    comm_path

    @comment = Comment.find_by(id: params[:id])
    auth_edit(@comment)
        #need to sanitize
        # params[:comment][:content] = need params[:comment][:content]
    @comment.update(content: params[:comment][:content])
    redirect "/#{@comment_path}/#{@commentable_id}"
  end


  delete '/comments/:id' do
    @commentable_id = params[:comment][:commentable_id]
    @commentable_type = params[:comment][:commentable_type]
    comm_path
    
    @comment = Comment.find_by(id: params[:id])
    auth_edit(@comment)
        @comment.delete
        redirect "/#{@comment_path}"
    end
end