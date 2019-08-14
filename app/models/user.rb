class User < ActiveRecord::Base
  has_secure_password

  validates :name, presence: true
  validates :username, presence: true
  validates :username, uniqueness: true
  validates :password, length: {in: 8..20}, confirmation: true, unless: ->(u){ u.password.blank? }



  has_many :comments
  has_many :ratings
  has_many :reactions
  has_many :fave_quotes

end