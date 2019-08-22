class Book < ActiveRecord::Base
  validates :title, uniqueness: true, presence: true
  validates :year, presence: true
  
  belongs_to :author
  has_many :comments, as: :commentable
  has_many :ratings, as: :ratable
  has_many :fave_quotes, as: :quotable


end