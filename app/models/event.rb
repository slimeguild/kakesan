# coding: utf-8
class Event < ActiveRecord::Base
  TITLE_MAX_LENGTH = 9
  KAKESAN_MAX_LENGTH = 12
  DESCRIPTION_MAX_LENGTH = 256
  PER_PAGE = 10
  
  attr_accessible :user_id, :title, :where, :who, :what, :description
  
  belongs_to :user
  has_many   :entries, dependent: :destroy
  has_many   :users, through: :entries
  has_many   :comments, order: 'created_at desc', dependent: :destroy
  scope :newly, order('created_at desc')
  validates :title, presence: true, length: {maximum: TITLE_MAX_LENGTH}
  validates :where, presence: true, length: {maximum: KAKESAN_MAX_LENGTH}
  validates :who, presence: true, length: {maximum: KAKESAN_MAX_LENGTH}
  validates :what, presence: true, length: {maximum: KAKESAN_MAX_LENGTH}
  validates :description, length: {maximum: DESCRIPTION_MAX_LENGTH}

  def custom_title
    self.title + 'が好き'
  end

  def participants
    participants = [self.user]
    participants += User.find(self.comments.map(&:user_id).uniq)
    participants.uniq
  end
end
