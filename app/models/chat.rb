class Chat < ActiveRecord::Base
  MESSAGE_MAX_LENGTH = 140
  attr_accessible :user_id, :talk_id, :message
  belongs_to :user
  belongs_to :talk, touch: true
  validates :message, presence: true, length: {maximum: MESSAGE_MAX_LENGTH}
end
