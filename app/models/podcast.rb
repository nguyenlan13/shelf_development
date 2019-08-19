class Podcast < ActiveRecord::Base
  validates :name, uniqueness: true, presence: true
  validates :episode_title, uniqueness: true, presence: true
  validates :year, presence: true
  validates :source, presence: true

  belongs_to :author
  has_many :comments, as: :commentable
  has_many :ratings, as: :ratable
  has_many :fave_quotes, as: :quotable
end