class Comment < ActiveRecord::Base
  MAX_LENGTH = 128
  attr_accessible :user_id, :theme_id, :body
  belongs_to :user
  belongs_to :theme
  validates :body, presence: true, length: {maximum: MAX_LENGTH}
end
