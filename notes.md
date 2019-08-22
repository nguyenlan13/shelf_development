
/books/
  /books/add
  /books/view/:id
    get '/books/view/:id' do

    end
  /books/view/:id/comments


/user/
  /user/view/:user_id
  /user/view/:user_id/comments



  post '/comments/:id/reply/:commentable_id' do
		authenticate
    user = current_user
    @commentable_id = params[:comment][:commentable_id]
    @commentable_type = params[:comment][:commentable_type]
    @comment_path = params[:comment][:comment_path]
    Comment.create(user: user, content: params[:comment][:content], commentable_id: @commentable_id, commentable_type: @commentable_type)
		redirect "/#{@comment_path}/#{@commentable_id}"
	end



	# get '/comments/:id' do
	# 	authenticate
	# 	@user = current_user
	# 	@commentable = Comment.find_by(id: params[:id])
	# 	@comment = Comment.find_by(id: params[:id], commentable: @commentable)
	# 	erb :'comment/show'
	# end









-change source input type to url
-add a go back to home page
-add search function
-be able to add another book, podcast, or article
-upcase everything ?
-validate everything
-create a logout--DONE
-while loop to get all the comments and -replies to comments
-error pages--DONE
-add some css to distinguish comments and medias
-sort books alphabetically--DONE
-avg rating--DONE



book
-has many comments, as commentable
-has many ratings, as ratable
-has many fave_quotes, as quotable
-belongs to an author

podcast
-has many comments, as commentable
-has many ratings, as ratable
-has many fave_quotes, as quotable
-belongs to an author

article
-has many comments, as commentable
-has many ratings, as ratable
-has many fave_quotes, as quotable
-belongs to an author

author
-has many books
-has many podcasts
-has many articles

comment
-belongs to user
-belongs to commentable, polymorphic: true
-has many comments, as commentable
-has many reactions, as reactable

reaction
-belongs to a user
-belongs to comment, polymorphic: true


rating
-belongs to a user
-belongs to ratable, polymorphic: true
<!-- -belongs to a book, article, podcast -->

fave_quote
-belongs to a user
-belongs to quotable, polymorphic: true
<!-- -belongs to a book, article, podcast -->

user
-has many comments
-has many ratings
-has many reactions
-has many fave_quotes