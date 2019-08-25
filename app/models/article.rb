class Article < ActiveRecord::Base
  validates :author_id, presence: true
  validates :title, uniqueness: true, presence: true
  validates :year, presence: true, numericality: true, length: {is: 4}
  validates :source, presence: true
  
  belongs_to :author
  has_many :comments, as: :commentable
  has_many :ratings, as: :ratable
  has_many :fave_quotes, as: :quotable
end