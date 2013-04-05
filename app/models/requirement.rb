class Requirement < ActiveRecord::Base
  MAX_NUM = 3
  TITLE_MAX_LENGTH = 12
  attr_accessible :theme_id, :title
  belongs_to :theme
  validates :title, presence: true, length: {maximum: TITLE_MAX_LENGTH}
end
