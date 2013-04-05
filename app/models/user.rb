class User < ActiveRecord::Base
  STRING_MAX_LENGTH = 15
  TEXT_MAX_LENGTH = 160

  attr_accessible :nickname, :twitter_image, :description, :gender_id, :age_id, :area, :twitter_attributes
  has_one  :twitter, dependent: :destroy
  has_many :themes , dependent: :destroy
  has_many :entries, dependent: :destroy
  has_many :comments, dependent: :destroy
  belongs_to :gender
  belongs_to :age

  accepts_nested_attributes_for :twitter

  validates :area, length: {maximum: STRING_MAX_LENGTH}
  validates :nickname, presence: true, length: {maximum: STRING_MAX_LENGTH}
  validates :description, length: {maximum: TEXT_MAX_LENGTH}

  def entried_themes
    commented_themes = Theme.find(self.comments.map(&:theme_id)).to_a
    logger.info commented_themes
    hosted_themes = self.themes
    commented_themes - hosted_themes
  end

  def hosted_talks
    hosted_all = Talk.hosted_by(self)
    message_sended = hosted_all.message_sended_by(self)
    return message_sended.to_a + (hosted_all.to_a - message_sended.to_a)
  end
end