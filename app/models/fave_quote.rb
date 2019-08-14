class FaveQuote < ActiveRecord::Base
  belongs_to :user
  belongs_to :quotable, polymorphic: true

end