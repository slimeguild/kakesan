class User < ActiveRecord::Base
  STRING_MAX_LENGTH = 15
  TEXT_MAX_LENGTH = 160

  attr_accessible :nickname, :twitter_image, :description, :gender_id, :age_id, :area, :twitter_attributes
  has_one  :twitter, dependent: :destroy
  has_many :events , dependent: :destroy
  has_many :entries, dependent: :destroy
  has_many :comments, dependent: :destroy
  belongs_to :gender
  belongs_to :age

  accepts_nested_attributes_for :twitter

  validates :area, length: {maximum: STRING_MAX_LENGTH}
  validates :nickname, presence: true, length: {maximum: STRING_MAX_LENGTH}
  def entried_events
    commented_events = Event.find(self.comments.map(&:event_id)).to_a
    logger.info commented_events
    hosted_events = self.events
    commented_events - hosted_events
  end
end