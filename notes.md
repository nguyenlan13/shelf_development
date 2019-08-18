
/books/
  /books/add
  /books/view/:id
    get '/books/view/:id' do

    end
  /books/view/:id/comments


/user/
  /user/view/:user_id
  /user/view/:user_id/comments







-add search function
-be able to add another book, podcast, or article
-upcase everything ?
-validate everything
-create a logout
-while loop to get all the comments and -replies to comments
-error pages
-add some css to distinguish comments and medias
-sort books alphabetically--DONE
-avg rating 



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