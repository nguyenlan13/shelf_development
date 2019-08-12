user has many posts
comments belongs to a user
rating belongs to a user
post has many comments
fave_quotes belong to a user





book
-has many discussions through a user
-has many ratings through a user
-has many fave quotes through a user
-belongs to an author

podcast
-has many discussions through a user
-has many ratings through a user
-has many fave quotes through a user
-belongs to an author

article
-has many discussions through a user
-has many ratings through a user
-has many fave quotes through a user
-belongs to an author

author
-has many books
-has many podcasts
-has many articles

discussion
-belongs to user
-belongs to discussable, polymorphic: true
-has many discussions, as discussable
-has many reactions, as reactable

reaction
-belongs to a user
-belongs to reactable, polymorphic: true
-has many reactions, as reactable

rating
-belongs to a user
-belongs to a book

user
-has many discussions
-has many ratings
-has reactions
-has many fave quotes