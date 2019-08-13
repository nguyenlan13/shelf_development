

book
-has many comments through a user
-has many ratings through a user
-has many fave_quotes through a user
-belongs to an author

podcast
-has many comments through a user
-has many ratings through a user
-has many fave_quotes through a user
-belongs to an author

article
-has many comments through a user
-has many ratings through a user
-has many fave_quotes through a user
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
-belongs to reactable, polymorphic: true
-has many reactions, as reactable*

rating
-belongs to a user
-belongs to a book

fave_quote
-belongs to a user
-belongs to a book

user
-has many comments
-has many ratings
-has many reactions
-has many fave_quotes