class Discussion < ActiveRecord::Base

  belongs_to :user
  belongs_to :discussable, polymorphic: true

  has_many :discussions, as: discussable
  has many :reactions, as: reactable
end