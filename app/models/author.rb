class Author < ActiveRecord::Base
  has_many :books
  has_many :podcasts
  has_many :articles
end