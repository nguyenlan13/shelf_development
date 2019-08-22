class FaveQuote < ActiveRecord::Base
  belongs_to :user
  belongs_to :quotable, polymorphic: true

  has_many :reactions, as: :reactable
end