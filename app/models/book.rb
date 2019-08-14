class Book < ActiveRecord::Base


  belongs_to :author
  has_many :comments, as: :commentable
  has_many :ratings
  has_many :fave_quotes

end