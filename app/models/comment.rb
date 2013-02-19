class Comment < ActiveRecord::Base
  MAX_LENGTH = 128
  attr_accessible :user_id, :event_id, :body
  belongs_to :user
  belongs_to :event
  validates :body, presence: true, length: {maximum: MAX_LENGTH}
end
