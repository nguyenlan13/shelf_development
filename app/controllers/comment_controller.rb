class CommentController < ApplicationController

  ##COMMENTS - polymorphic
  
	post '/comments' do
		authorize
    user = current_user
    @commentable_id = params[:comment][:commentable_id]
    @commentable_type = params[:comment][:commentable_type]
    # @comment_path = params[:comment][:comment_path]
    Comment.create(user: user, content: params[:comment][:content], commentable_id: @commentable_id, commentable_type: @commentable_type)
   
    redirect "/#{@commentable_type}s/#{@commentable_id}"
	end

  get '/comments/:id/edit' do
    authorize
    @comment = Comment.find_by(id: params[:id])
    if @comment.user_id != current_user.id
      redirect '/access-denied'    
    end
    erb :"comment/edit"
  end

  patch '/comments/:id' do
    authorize
    @commentable_id = params[:comment][:commentable_id]
    @commentable_type = params[:comment][:commentable_type]
    @comment_path = params[:comment][:comment_path]
    @comment = Comment.find_by(id: params[:id])
      if @comment.user_id != current_user.id
        redirect '/access-denied'    
      end
        params[:comment][:content] = params[:comment][:content]
        @comment.update(params[:comment])
        redirect "/#{@comment_path}/#{@commentable_id}"
  end

  delete '/comments/:id/delete' do
    authorize
    @commentable_id = params[:comment][:commentable_id]
    @commentable_type = params[:comment][:commentable_type]
    @comment_path = params[:comment][:comment_path]
    @comment = Comment.find_by(id: params[:id])
      if @comment.user_id != current_user.id
        redirect '/access-denied'    
      end
        @comment.delete
        redirect "/#{@comment_path}/#{@commentable_id}"
  end
end