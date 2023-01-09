##
##
## connecting with a user using user_id.
##
##

class Book < ApplicationRecord
  belongs_to :user

  validates :title, presence: true, length: {minimum: 1, maximum: 20}
  validates :body, presence: true, length: {maximum: 200}
end
