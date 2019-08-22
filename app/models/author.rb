class Author < ActiveRecord::Base
  validates :name, uniqueness: true, presence: true

  has_many :books
  has_many :podcasts
  has_many :articles
end