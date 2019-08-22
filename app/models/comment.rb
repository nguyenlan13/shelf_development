class Comment < ActiveRecord::Base
  validates :user_id, presence: true
  validates :content, presence: true
  validates :commentable_id, presence: true
  validates :commentable_type, presence: true


  belongs_to :user
  belongs_to :commentable, polymorphic: true

  has_many :comments, as: :commentable
  has_many :reactions, as: :reactable
end