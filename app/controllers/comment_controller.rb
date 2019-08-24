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


  get '/comments/:id/edit' do
    # authorize
    @comment = Comment.find_by(id: params[:id])
    # if @comment.user_id != current_user.id
    #   redirect '/access_denied'    
    # end
    auth_edit(@comment)
    erb :"comment/edit"
  end


  patch '/comments/:id' do
    # authorize
    @commentable_id = params[:comment][:commentable_id]
    @commentable_type = params[:comment][:commentable_type]
    comm_path

    @comment = Comment.find_by(id: params[:id])
      auth_edit(@comment)
      # if @comment.user_id != current_user.id
      #   redirect '/access_denied'     
      # else
        #need to sanitize
        # params[:comment][:content] = need params[:comment][:content]
       @comment.update(content: params[:comment][:content])
      # end
        redirect "/#{@comment_path}/#{@commentable_id}"
  end


  delete '/comments/:id' do
    # authorize
    # @commentable_id = params[:comment][:commentable_id]
    # @commentable_type = params[:comment][:commentable_type]
    comm_path
    
    @comment = Comment.find_by(id: params[:id])
    auth_edit(@comment)
      # if @comment.user_id != current_user.id
      #   # binding.pry
      #   redirect '/access_denied'  
      # else
        @comment.delete  
        # binding.pry
        # redirect "/#{@comment_path}/#{@book.id}"
        redirect "/#{@comment_path}"
      # end
    end
end