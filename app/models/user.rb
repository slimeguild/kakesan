class User < ActiveRecord::Base
  attr_accessible :name, :nickname, :image, :description
  has_one  :twitter, dependent: :destroy
  has_many :events , dependent: :destroy
  has_many :entries, dependent: :destroy
  has_many :comments, dependent: :destroy

  def entried_events
    commented_events = Event.find(self.comments.map(&:event_id)).to_a
    logger.info commented_events
    hosted_events = self.events
    commented_events - hosted_events
  end
end
