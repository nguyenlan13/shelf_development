class FaveQuote < ActiveRecord::Base
  validates :user_id, presence: true
  validates :quotable_id, presence: true
  validates :quotable_type, presence: true
  validates :quote, presence: true, length: {in: 500}

  belongs_to :user
  belongs_to :quotable, polymorphic: true

  has_many :reactions, as: :reactable
end