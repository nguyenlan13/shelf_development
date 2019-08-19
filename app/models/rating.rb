class Rating < ActiveRecord::Base
  validates :rate, numericality: true
  belongs_to :user
  belongs_to :ratable, polymorphic: true
end