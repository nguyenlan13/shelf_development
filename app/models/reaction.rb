class Reaction < ActiveRecord::Base
  validates :user_id, presence: true
  validates :reactable_id, presence: true
  validates :reactable_type, presence: true
  validates :reaction_type, presence: true

  belongs_to :user
  belongs_to :reactable, polymorphic: true
end