class Article < ActiveRecord::Base
  belongs_to :author
  has_many :article_comments, through: :comments, source: :user
  has_many :ratings, through: :users
  has_many :fave_quotes, through: :users
end